class Task < ActiveRecord::Base

  belongs_to :category
  belongs_to :user
  belongs_to :member

  has_many :tag_tasks
  has_many :tags, through: :tag_tasks

  validates :name, presence: true
  validates :status, presence: true, default: false
  validates :user, presence: true


end
