class Review < ApplicationRecord
    belongs_to :book
    belongs_to :user

    ratyrate_rateable "reviews"
end
