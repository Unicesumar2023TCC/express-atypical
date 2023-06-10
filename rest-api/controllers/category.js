const multer = require('multer');
const upload = multer();

module.exports = function(api){

    const CategoryModel = require('../models/category');

    api.get('/category/:id?', async function (request, response){
        const category = await CategoryModel.getCategoriesByUserId(request.params.id);
        response.json(category);
    })

    //add new category
    api.post('/category', upload.none(), async function(request, response){
        data = await CategoryModel.insertNewCategory(request.body);
        response.json(data);
    });

    //edit category
    api.put('/category', upload.none(), async function(request, response){
        data = await CategoryModel.updateCategory(request.body);
        response.json(data);
    });

    //delete category
    api.delete('/category/:id?', upload.none(), async function(request, response){
        data = await CategoryModel.deleteCategoryById(request.params.id);
        response.json(data);
    });
}