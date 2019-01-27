class User < ApplicationRecord
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, presence: true, uniqueness: true, :uniqueness => { :case_sensitive => false }
  validates :password, presence: true, confirmation: true, length: { minimum: 6 }, :on => :create
  has_one_attached :avatar
  has_many :books
  has_secure_password

end
