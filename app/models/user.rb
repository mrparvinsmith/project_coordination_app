class User < ActiveRecord::Base
  # has_many(:project_members, :posts)
  has_secure_password
end
