class RemoveOptionFromProducts < ActiveRecord::Migration[5.0]
  def change
    change_column_null :products, :name, true
    change_column_null :products, :detail, true
    change_column_null :products, :price, true
    change_column_null :products, :condition, true
    change_column_null :products, :delivery_cost, true
    change_column_null :products, :prefecture, true
    change_column_null :products, :delivery_date, true
    change_column_null :products, :user_id, true
    change_column_null :products, :status, true
  end
end
