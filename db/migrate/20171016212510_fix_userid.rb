class FixUserid < ActiveRecord::Migration[5.0]
  def change
    remove_column :works, :userid, :string, null: false
  end
end
