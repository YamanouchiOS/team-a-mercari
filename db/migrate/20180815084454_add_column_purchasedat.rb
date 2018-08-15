class AddColumnPurchasedat < ActiveRecord::Migration[5.0]
  def up
    add_column :products, :purchased_at, :datetime
  end

  def down
    add_column :products, :purchased_at, :datetime
  end
end
