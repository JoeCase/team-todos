class Tag < ActiveRecord::Base
  has_many :tag_tasks
  has has_many :tasks, through: :tag_tasks

  validates :name, presence: true

end
