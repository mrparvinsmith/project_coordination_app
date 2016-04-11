class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :content
      t.string :user_id
      t.string :task_id
      t.timestamp :time_posted

      t.timestamps null: false
    end
  end
end
