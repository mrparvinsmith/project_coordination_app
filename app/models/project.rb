class Project < ActiveRecord::Base
  has_many :project_members
  has_many :tasks

  def members
    self.project_members.map do |member|
      member.user
    end
  end
end
