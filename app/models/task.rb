class Task < ActiveRecord::Base
  belongs_to(:project)
  has_many(:posts)

  validates :deadline, presence: true
end
