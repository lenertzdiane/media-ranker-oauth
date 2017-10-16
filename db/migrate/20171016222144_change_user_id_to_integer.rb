class ChangeUserIdToInteger < ActiveRecord::Migration[5.0]
  def change
    remove_column :works, :user_id, :integer, null: false
  end
end
