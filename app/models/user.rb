class User < ActiveRecord::Base
  has_many :posts
  has_many :project_members
  has_secure_password

  def projects
    self.project_members.map do |member|
      member.project
    end
  end

  validates :email, uniqueness: true

end
