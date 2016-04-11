class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.string :content
      t.datetime :deadline
      t.integer :project_id

      t.timestamps null: false
    end
  end
end
