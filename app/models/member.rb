class Member < ActiveRecord::Base

  belongs_to :user
  has_many :tasks

  validates :first_name, :last_name, :phone, :user, presence: true
  validates :email, presence: true, format: {with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i }

  before_save :generate_url


  def generate_url
    self.url = SecureRandom.hex
  end


end
