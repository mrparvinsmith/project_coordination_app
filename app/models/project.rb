class Project < ActiveRecord::Base
  has_many :project_members, dependent: :destroy
  has_many :tasks, dependent: :destroy

  def members
    self.project_members.map do |member|
      member.user
    end
  end

  validates :name, presence: true
end
