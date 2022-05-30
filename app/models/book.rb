class Book < ApplicationRecord  
    belongs_to :user
    belongs_to :category
    has_many :reviews, dependent: :destroy
    has_many :content, dependent: :destroy
    has_many :taggables, dependent: :destroy
    has_many :tags, through: :taggables

    # validates :title, presence: true, length: { maximum: 7 }
    # validates :description, presence: true
    # validates :author, presence: true, length: { maximum: 20 }

    has_attached_file :book_img, styles: { book_index: "250x350>", book_show: "325x475>" }, default_url: "/images/:style/missing.png"
    validates_attachment_content_type :book_img, content_type: /\Aimage\/.*\z/
end
