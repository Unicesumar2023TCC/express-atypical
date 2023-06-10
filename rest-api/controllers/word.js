const multer = require('multer');
const upload = multer();

module.exports = function(api){

    const WordModel = require('../models/word');

    api.get('/word/:id?', async function (request, response){
        const word = await WordModel.getWordsByCategoryId(request.params.id);
        response.json(word);
    })

    //add new word
    api.post('/word', upload.none(), async function(request, response){
        data = await WordModel.insertNewWord(request.body);
        response.json(data);
    });

    //edit word
    api.put('/word', upload.none(), async function(request, response){
        data = await WordModel.updateWordById(request.body);
        response.json(data);
    });

    //delete word
    api.delete('/word/:id?', upload.none(), async function(request, response){
        data = await WordModel.deleteWordById(request.params.id);
        response.json(data);
    });
}