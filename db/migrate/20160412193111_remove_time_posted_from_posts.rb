class RemoveTimePostedFromPosts < ActiveRecord::Migration
  def change
    remove_column :posts, :time_posted, :datetime
  end
end
