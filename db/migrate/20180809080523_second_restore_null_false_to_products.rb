class SecondRestoreNullFalseToProducts < ActiveRecord::Migration[5.0]
  def change
    change_column_null :products, :user_id, false
  end
end
