class Task < ActiveRecord::Base
  belongs_to :project
  has_many :posts, dependent: :destroy

  validates :content, presence: true
  validates :deadline, presence: true
end
