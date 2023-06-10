const multer = require('multer');
const upload = multer();

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
        data = await UserModel.insertNewUser(request.body);
        response.json(data);
    });

    //edit user
    api.put('/user', upload.none(), async function(request, response){
        request.body.birthDate = new Date(request.body.birthDate);
        data = await UserModel.updateUser(request.body);
        response.json(data);
    });

    //delete user
    api.delete('/user/:id?', upload.none(), async function(request, response){
        data = await UserModel.deleteUserById(request.params.id);
        response.json(data);
    });
}