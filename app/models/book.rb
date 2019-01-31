class Book < ApplicationRecord
  validates :title, presence: true
  validates :author, presence: true
  validates :description, presence: true
  has_one_attached :avatar
  belongs_to :user, optional: true
   belongs_to :category, optional: true



end
