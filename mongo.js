//const is just another let 
//we declare a constant variable called mongoose
//we set it equal to the return value of require('mongoose'); 
const mongoose = require('mongoose'); 

//access the connect method of the mongoose object
//pass in the localhost test database
//and some options inside of another object
mongoose.connect('mongodb://localhost/test', {useNewUrlParser: true, useUnifiedTopology: true});

//make another constant variable called db
//and we set it equal to the connection property of our mongoose object 
const db = mongoose.connection;

//but then we acces the on and once methods of our connection property from our mongoose object
db.on('error', console.error.bind(console, 'connection error:'));
db.once('open', function(){
    //your tutorial and new code go here. 
    console.log("We're connected");

    /* schema  */
    const ingredientSchema = new mongoose.Schema({
        name : String,
        measurement: String, 
        amount : Number 
    });

    const recipeSchema = new mongoose.Schema({
        name : String, 
        description: String,
        instructions: String,
        ingredients : [ingredientSchema]
    }); 


    /* model */ 
    const Recipe = mongoose.model('Recipe', recipeSchema); 

    /* documents */ 
    let stoneSoupObj = {
        name : "Stone Soup", 
        description: "A soup made by tricked villagers",
        instructions: "Trick each villager into donating for the soup for everyone",
        ingredients : [ 
            { name : "Carrots",
            measurement: "Cups", 
            amount : 5 },
            
            { name : "Onions",
            measurement: "Cups", 
            amount : 5.5 },

            { name : "Whatever is on hand",
            measurement: "Cups", 
            amount : 5 
            }
        ]
    };

    let stoneSoup = new Recipe(stoneSoupObj);

    let silence = new Kitten({ name : "Silence" }); 
    silence.speak(); 
    silence.name = "Loud";

    const fluffy = new Kitten({name : "fluffy"}); 
    fluffy.speak(); 

    /* how to save a document after it's been created/updated */ 
    fluffy.save(function(err, fluffy){
        if(err) return console.error(err); 
        fluffy.speak(); 
    });

    silence.save(function(err,cat){
        if(err) return console.error(err);
        cat.speak(); 
    })
    
    /*find is a method attached directly to our Kitten model/class */ 
    Kitten.find(function(err, kittens){
        if(err) return console.error(err);
        console.log(kittens); 
    })

    /* mongoose supports mongodb's rich query language */ 
    Kitten.find({ name: /^fluff/ }, function(err,cat){
        //check for errors
        //print to console. 
    })

});
