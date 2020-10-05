class Book < ApplicationRecord
    attr_accessor :initials
    validates :title, :author, :genre, :price, :publisheddate, presence: {message: 'cannot be blank.'}
end
