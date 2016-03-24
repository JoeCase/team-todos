class Task < ActiveRecord::Base

  belongs_to :category
  belongs_to :user
  belongs_to :member

  has_many :tag_tasks
  has_many :tags, through: :tag_tasks

  validates :name, presence: true
  validates :status, presence: true
  validates :user, presence: true


    def print_priority
      case self.priority
      when 1
        "Low"
      when 2
        "Medium"
      when 3
        "High"
      end
    end

    def print_assigned_to
      member.first_name
    end
end
