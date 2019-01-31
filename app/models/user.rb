class User < ApplicationRecord
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, presence: true, uniqueness: true, :uniqueness => { :case_sensitive => false }
  validates :password, presence: true, confirmation: true, length: { minimum: 6 }, :on => :create
  has_one_attached :avatar
  validates :agreement, presence: true
  has_many :books



  has_secure_password


  has_many :messages
  has_many :subscriptions
  has_many :chats, through: :subscriptions
  def existing_chats_users
    existing_chat_users = []
    self.chats.each do |chat|
      existing_chat_users.concat(chat.subscriptions.where.not(user_id: self.id).map {|subscription| subscription.user})
    end
    existing_chat_users.uniq
  end
end
