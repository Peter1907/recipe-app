# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
Recipe.destroy_all
Food.destroy_all

Recipe.create(name: "Pasta", preparation_time: 10, cooking_time: 20, description: "Pasta with tomato sauce", public: true, user_id: 1)
Recipe.create(name: "Pizza", preparation_time: 10, cooking_time: 20, description: "Pizza with tomato sauce", public: true, user_id: 1)
Recipe.create(name: "Rice", preparation_time: 10, cooking_time: 20, description: "Rice with tomato sauce", public: true, user_id: 1)
Recipe.create(name: "Burger", preparation_time: 10, cooking_time: 20, description: "Burger with tomato sauce", public: true, user_id: 1)
Recipe.create(name: "Salad", preparation_time: 10, cooking_time: 20, description: "Salad with tomato sauce", public: true, user_id: 1)

Food.create(name: "Tomato", measurement_unit: "kg", price: 1.5, quantity: 10, user_id: 1)
Food.create(name: "Onion", measurement_unit: "kg", price: 1.5, quantity: 10, user_id: 1)
Food.create(name: "Potato", measurement_unit: "kg", price: 1.5, quantity: 10, user_id: 1)
Food.create(name: "Carrot", measurement_unit: "kg", price: 1.5, quantity: 10, user_id: 1)
Food.create(name: "Cucumber", measurement_unit: "kg", price: 1.5, quantity: 10, user_id: 1)

RecipesFood.create(recipe_id: 1, food_id: 1, quantity: 1)
RecipesFood.create(recipe_id: 1, food_id: 2, quantity: 1)
RecipesFood.create(recipe_id: 1, food_id: 3, quantity: 1)
RecipesFood.create(recipe_id: 1, food_id: 4, quantity: 1)
RecipesFood.create(recipe_id: 1, food_id: 5, quantity: 1)