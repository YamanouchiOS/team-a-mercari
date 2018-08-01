class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :name, null: false, add_index: true
      t.text :detail, null: false
      t.unsigned_integer :price, null: false
      t.references :user, null: false, foreign_key: true
      t.integer :condition, null: false
      t.integer :delivery_cost, null: false
      t.integer :prefecture, null: false
      t.integer :delivery_date, null: false
      t.integer :status, null: false
      t.integer :likes_count, default: 0
      t.timestamps null: false
    end
  end
end

# condition, delivery_cost, prefecture, delivery_date, statusは enum型をモデルで定義
