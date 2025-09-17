# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
Book.create(title: "The Great Gatsby", author: "F. Scott Fitzgerald", published_year: 1925)
Book.create(title: "To Kill a Mockingbird", author: "Harper Lee", published_year: 1960)
Book.create(title: "1984", author: "George Orwell", published_year: 1949)
Book.create(title: "Pride and Prejudice", author: "Jane Austen", published_year: 1813)
Book.create(title: "The Catcher in the Rye", author: "J.D. Salinger", published_year: 1951)