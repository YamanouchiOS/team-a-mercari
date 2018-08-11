class RestoreNullTrueToProducts < ActiveRecord::Migration[5.0]
  def change
    change_column_null :products, :user_id, true
  end
end
