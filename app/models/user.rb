class User < ApplicationRecord
  has_many :books, dependent: :destroy
  has_many :reviews, dependent: :destroy
  has_many :content, dependent: :destroy

  ratyrate_rater
 
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
