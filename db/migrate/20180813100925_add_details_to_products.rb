class AddDetailsToProducts < ActiveRecord::Migration[5.0]
  def change
    add_reference :products, :buyer, foreign_key: { to_table: :users }
  end
end
