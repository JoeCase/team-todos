class User < ActiveRecord::Base

  has_secure_password

  has_many :categories
  has_many :tasks
  has_many :members

  validates :email, presence: true, uniqueness: true, format: {with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i }
  validates :first_name, presence: true

end
