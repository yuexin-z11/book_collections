class Book < ApplicationRecord
    validates :title, presence: true
    # validates :author, presence: true
    # validates :price, numericality: { greater_than_or_equal_to: 0 }, allow_nil: true
    # validates :published_date, presence: true
end
