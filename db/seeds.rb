# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
Book.create(title: "The Great Gatsby", author: "F. Scott Fitzgerald", published_date: Date.new(1925, 1, 1))
Book.create(title: "To Kill a Mockingbird", author: "Harper Lee", published_date: Date.new(1960, 1, 1))
Book.create(title: "1984", author: "George Orwell", published_date: Date.new(1949, 1, 1))
Book.create(title: "Pride and Prejudice", author: "Jane Austen", published_date: Date.new(1813, 1, 1))
Book.create(title: "The Catcher in the Rye", author: "J.D. Salinger", published_date: Date.new(1951, 1, 1))
