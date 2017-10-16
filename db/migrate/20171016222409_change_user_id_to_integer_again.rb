class ChangeUserIdToIntegerAgain < ActiveRecord::Migration[5.0]
  def change
    add_column :works, :owner, :integer, null: false
  end
end
