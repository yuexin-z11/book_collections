require 'rails_helper'

RSpec.describe "Books management", type: :system do
  before { driven_by(:rack_test) } # Simulates a browser without JS

  let(:today) { Date.today }

  # Sunny day: all fields are filled correctly
  it "creates a book successfully (sunny day)" do
    visit root_path
    click_link "Add a New Book"

    fill_in "Title", with: "Test Book"
    fill_in "Author", with: "John Doe"
    fill_in "Price", with: 10.5

    select today.year.to_s, from: "book_published_date_1i"
    select Date::MONTHNAMES[today.month], from: "book_published_date_2i"
    select today.day.to_s, from: "book_published_date_3i"

    click_button "Create Book"

    expect(page).to have_content("Book was successfully created.")
    expect(Book.last.title).to eq("Test Book")
    expect(Book.last.author).to eq("John Doe")
    expect(Book.last.price).to eq(10.5)
    expect(Book.last.published_date).to eq(today)
  end

  # Rainy day: title is missing
  it "fails to create a book without a title (rainy day)" do
    visit root_path
    click_link "Add a New Book"

    fill_in "Title", with: ""
    fill_in "Author", with: "John Doe"
    fill_in "Price", with: 10.5

    select today.year.to_s, from: "book_published_date_1i"
    select Date::MONTHNAMES[today.month], from: "book_published_date_2i"
    select today.day.to_s, from: "book_published_date_3i"

    click_button "Create Book"

    expect(page).to have_content("Title can't be blank")
  end

  # Rainy day: author is missing
  it "fails to create a book if author is missing" do
    visit root_path
    click_link "Add a New Book"

    fill_in "Title", with: "Test Book"
    fill_in "Author", with: ""
    fill_in "Price", with: 10.5

    select today.year.to_s, from: "book_published_date_1i"
    select Date::MONTHNAMES[today.month], from: "book_published_date_2i"
    select today.day.to_s, from: "book_published_date_3i"

    click_button "Create Book"

    expect(page).to have_content("Author can't be blank")
  end

  # Rainy day: published_date missing
  it "fails to create a book if published date is missing" do
    visit root_path
    click_link "Add a New Book"

    fill_in "Title", with: "Test Book"
    fill_in "Author", with: "John Doe"
    fill_in "Price", with: 10.5

    click_button "Create Book"

    expect(page).to have_content("Published date can't be blank")
  end

  # Rainy day: price is missing
  it "fails to create a book if price is missing" do
    visit root_path
    click_link "Add a New Book"

    fill_in "Title", with: "Test Book"
    fill_in "Author", with: "John Doe"

    select today.year.to_s, from: "book_published_date_1i"
    select Date::MONTHNAMES[today.month], from: "book_published_date_2i"
    select today.day.to_s, from: "book_published_date_3i"

    click_button "Create Book"

    expect(page).to have_content("Price can't be blank")
  end
end
