class ChangeTypeToProducts < ActiveRecord::Migration[5.0]
  def up
    change_column :users, :products_count, :integer, default: 0
  end

  def down
    change_column :users, :products_count, :string, default: 0
  end
end
