class RestoreNullFalseToProducts < ActiveRecord::Migration[5.0]
  def change
    change_column_null :products, :name, false
    change_column_null :products, :detail, false
    change_column_null :products, :price, false
    change_column_null :products, :condition, false
    change_column_null :products, :delivery_cost, false
    change_column_null :products, :prefecture, false
    change_column_null :products, :delivery_date, false
    change_column_null :products, :status, false
    change_column_null :products, :user_id, false
  end
end
