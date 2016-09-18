class AlterCommentsAddUserId < ActiveRecord::Migration[5.0]
  def up
    add_column :comments, :user_id, :integer
    add_index :comments, :user_id
  end

  def down
    remove_index :comments, :user_id
    remove_column :comments, :user_id
  end
end
