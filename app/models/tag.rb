class Tag < ApplicationRecord
    has_many :taggables, dependent: :destroy
    has_many :books, through: :taggables
end
