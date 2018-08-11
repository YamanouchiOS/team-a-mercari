class AddOptionToProduct < ActiveRecord::Migration
  def change
    change_column_default :products, :status, 0
  end
end
