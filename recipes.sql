/* SQL Script for Recipe App MySQL database.  This is the SQL code to perform CRUD operations in a SQL database. */

/* This is the schema (meaning just the structure, not the data) and it is rarely created by hand... most of the time, database administrators will use some kind of GUI software that exports this SQL code.  Running this portion of the script in sqlfiddle.com will define your schema. */

create table Recipe (id INT NOT NULL PRIMARY KEY AUTO_INCREMENT, name VARCHAR(25), description VARCHAR(50), instructions VARCHAR(500)) ENGINE=InnoDB DEFAULT CHARSET=utf8;

create table Ingredient (id INT NOT NULL PRIMARY KEY AUTO_INCREMENT, name VARCHAR(50)) ENGINE=InnoDB DEFAULT CHARSET=utf8; 

create table Measure (id INT NOT NULL PRIMARY KEY AUTO_INCREMENT, name VARCHAR(30)) ENGINE=InnoDB DEFAULT CHARSET=utf8; 

create table RecipeIngredient (recipe_id INT NOT NULL, ingredient_id INT NOT NULL, measure_id INT, amount INT, 

	CONSTRAINT fk_recipe FOREIGN KEY(recipe_id) REFERENCES Recipe(id), 

	CONSTRAINT fk_ingredient FOREIGN KEY(ingredient_id) REFERENCES Ingredient(id), 

	CONSTRAINT fk_measure FOREIGN KEY(measure_id) REFERENCES Measure(id)) 

	ENGINE=InnoDB DEFAULT CHARSET=utf8; 
  

/* With the schema created, we can insert rows (aka records) of data in to the tables.  This is the "Create" part of CRUD.  Notice that the RecipeIngredient table is full of foreign keys, meaning that this table maps all the other tables together. */	

INSERT INTO Measure (name) VALUES('CUP'), ('TEASPOON'), ('TABLESPOON'), ('WHOLE');

INSERT INTO Ingredient (name) VALUES('egg'), ('salt'), ('sugar'), ('chocolate'), ('vanilla extract'), ('flour');

INSERT INTO Recipe (name, description, instructions) VALUES('Boiled Egg','A single boiled egg','Add egg to cold water. Bring water to boil. Cook.');
INSERT INTO Recipe (name, description, instructions) VALUES('Chocolate Cake','Yummy cake','Add eggs, flour, chocolate to pan. Bake at 350 for 1 hour');

INSERT INTO RecipeIngredient (recipe_id, ingredient_id, measure_id, amount) VALUES (1, 1, NULL, 1);
INSERT INTO RecipeIngredient (recipe_id, ingredient_id, measure_id, amount)  VALUES (2, 1, NULL, 3);
INSERT INTO RecipeIngredient (recipe_id, ingredient_id, measure_id, amount)  VALUES (2, 2, 2, 1);
INSERT INTO RecipeIngredient (recipe_id, ingredient_id, measure_id, amount)  VALUES (2, 3, 1, 2);
INSERT INTO RecipeIngredient (recipe_id, ingredient_id, measure_id, amount)  VALUES (2, 4, 1, 1);

/* The SELECT statement is the most common way to read data from the database.  This is the "Read" in CRUD */
SELECT *
From Recipe r
JOIN RecipeIngredient ri on ri.recipe_id = r.id  
JOIN Ingredient i on i.id = ri.ingredient_id 
WHERE i.name = 'egg';

/* get all the ingredients and names. Notice that this is getting kind of messy?  That's one reason for the growth of MongoDB and NoSQL in general */ 
SELECT r.name AS 'Recipe', r.instructions, ri.amount AS 'Amount', mu.name AS 'Unit of Measure', i.name AS 'Ingredient' 
FROM Recipe r 
JOIN RecipeIngredient ri on r.id = ri.recipe_id 
JOIN Ingredient i on i.id = ri.ingredient_id 
LEFT OUTER JOIN Measure mu on mu.id = measure_id;

/* Update is the U in CRUD */
UPDATE Ingredient
SET name = 'Brown Sugar'
WHERE name = 'Sugar';

/* Delete, the D in CRUD */
/* Delete the row of data from the Recipe table where the id is 1. */
DELETE FROM Recipe WHERE id=1;


/*Requirements for lab 1*/
/*Insert 3 new recipes and their ingredients, amounts, and measures in to the Database*/
INSERT INTO Recipe (name, description, instructions) VALUES('Chocolate truffle','Simple chocolate truffle','Melt chocolate chips and butter in microwave for 2 minutes in a bowl, then add cream to mixture. Pour mixture into mold and let them set.');
INSERT INTO Recipe (name, description, instructions) VALUES('Peanut Butter cookies', 'PB coockies', 'Mix peanut butter, sugar, and egg together in a bowl using an electric mixer until smooth and creamy. Roll mixture into small balls and arrange on a baking sheet and bake for 10 minutes');
INSERT INTO Recipe (name, description, instructions) VALUES('Mango Ice Cream', 'Healthy ice cream', 'Layer greek yogurt, mango chunks, ginger, and water in a blender in the order listed. Pulse 4 times; blend until smooth, adding more water to reach desired consistency.');

INSERT INTO Ingredient (name) VALUES('chocolate chips'), ('butter'), ('cream'), ('peanut butter'), ('greek yogurt'), ('mango chunks'), ('ginger'), ('water');

INSERT INTO Measure (name) VALUES ('POUND'), ('GRAM'), ('KILOGRAM');

INSERT INTO RecipeIngredient (recipe_id, ingredient_id, measure_id, amount)  VALUES (3, 7, 1, 2);
INSERT INTO RecipeIngredient (recipe_id, ingredient_id, measure_id, amount)  VALUES (3, 8, 3, 2);
INSERT INTO RecipeIngredient (recipe_id, ingredient_id, measure_id, amount)  VALUES (3, 9, 3, 2);
INSERT INTO RecipeIngredient (recipe_id, ingredient_id, measure_id, amount)  VALUES (4, 10, 1, 1);
INSERT INTO RecipeIngredient (recipe_id, ingredient_id, measure_id, amount)  VALUES (4, 3, 3, 4);
INSERT INTO RecipeIngredient (recipe_id, ingredient_id, measure_id, amount)  VALUES (4, 1, null, 2);
INSERT INTO RecipeIngredient (recipe_id, ingredient_id, measure_id, amount)  VALUES (5, 11, 6, 10);
INSERT INTO RecipeIngredient (recipe_id, ingredient_id, measure_id, amount)  VALUES (5, 12, 7, 1);
INSERT INTO RecipeIngredient (recipe_id, ingredient_id, measure_id, amount)  VALUES (5, 13, 3, 1);
INSERT INTO RecipeIngredient (recipe_id, ingredient_id, measure_id, amount)  VALUES (5, 14, 3, 1);

/*Write a query to get a list of all the Recipes*/
SELECT * FROM RECIPE;

/*Write a query to get a list of Recipes that use a certain Ingredient*/
SELECT *
From Recipe r
JOIN RecipeIngredient ri on ri.recipe_id = r.id  
JOIN Ingredient i on i.id = ri.ingredient_id 
WHERE i.name = 'sugar';

/*Write a query to update a recipe you added*/
UPDATE Ingredient
SET name = 'dark chocolate'
WHERE name = 'chocolate';
