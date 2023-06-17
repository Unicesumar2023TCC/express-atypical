const multer = require('multer');
const upload = multer();
const bcrypt = require('bcrypt');
const jwt = require('jsonwebtoken');

module.exports = function(api){

    const UserModel = require('../models/user');

    api.get('/user', async function (request, response){
        const user = await UserModel.getAllUsers();
        response.json(user);
    })

    api.get('/user/:id?', async function (request, response){
        const user = await UserModel.getUserById(request.params.id);
        response.json(user);
    })

    //add new user
    api.post('/user', upload.none(), async function(request, response){
        request.body.birthDate = new Date(request.body.birthDate);
        request.body.password = bcrypt.hashSync(request.body.password, 10);
        data = await UserModel.insertNewUser(request.body);
        response.json(data);
    });

    //edit user
    api.put('/user', upload.none(), async function(request, response){
        request.body.birthDate = new Date(request.body.birthDate);
        request.body.password = bcrypt.hashSync(request.body.password, 10);
        data = await UserModel.updateUser(request.body);
        response.json(data);
    });

    //delete user
    api.delete('/user/:id?', upload.none(), async function(request, response){
        data = await UserModel.deleteUserById(request.params.id);
        response.json(data);
    });

    //login user
    api.post('/login', upload.none(), async function(request, response){
        data = await UserModel.checkUserLogin(request.body.email);
        if(data.length > 0){
            /* response.json(request.body.password); */
            bcrypt.compare(request.body.password, data[0].password, function(err, result) {
                if(result){
                    token = jwt.sign(data[0], "MySecretKey", {expiresIn: '01m'});
                    response.json({token: token});
                }else{
                    response.json('login incorreto');
                }
                if(err){
                    response.json('n deu boa');
                }
            });
        }else{
            response.json('login incorreto');
        }
    });
}