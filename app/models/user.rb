class User < ActiveRecord::Base
  has_many :posts, dependent: :destroy
  has_many :project_members
  has_secure_password

  def projects
    self.project_members.map do |job|
      job.project
    end
  end

  def name
    self.first_name + ' ' + self.last_name
  end

  validates :email, uniqueness: true

end
