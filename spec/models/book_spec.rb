require 'rails_helper'

RSpec.describe Book, type: :model do
  context "validations" do
    it "is valid with title, author, price, and published_date" do
      book = Book.new(
        title: "Test Book",
        author: "John Doe",
        price: 10.5,
        published_date: Date.today
      )
      expect(book).to be_valid
    end

    it "is invalid without a title" do
      book = Book.new(
        title: "",
        author: "John Doe",
        price: 10.5,
        published_date: Date.today
      )
      expect(book).not_to be_valid
      expect(book.errors[:title]).to include("can't be blank")
    end

    it "is invalid without an author" do
      book = Book.new(
        title: "Test Book",
        author: "",
        price: 10.5,
        published_date: Date.today
      )
      expect(book).not_to be_valid
      expect(book.errors[:author]).to include("can't be blank")
    end

    it "is invalid with negative price" do
      book = Book.new(
        title: "Test Book",
        author: "John Doe",
        price: -5,
        published_date: Date.today
      )
      expect(book).not_to be_valid
      expect(book.errors[:price]).to include("must be greater than or equal to 0")
    end

    it "is invalid without published_date" do
      book = Book.new(
        title: "Test Book",
        author: "John Doe",
        price: 10.5,
        published_date: nil
      )
      expect(book).not_to be_valid
      expect(book.errors[:published_date]).to include("can't be blank")
    end
  end
end
