class AddCompletedToTask < ActiveRecord::Migration
  def change
    add_column(:tasks, :completed, :boolean, null: false)
  end
end
