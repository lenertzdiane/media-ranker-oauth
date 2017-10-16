class AddUserIdToWork < ActiveRecord::Migration[5.0]
  def change
    add_column :works, :userid, :string, null: false
  end
end
