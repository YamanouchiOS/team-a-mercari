class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :name, null: false, add_index: true
      t.detail :text, null: false
      t.price :unsigned_integer, null: false
      t.user_id :references, null: false, foreign_key: true
      t.condition :integer, null: false
      t.delivery_cost :integer, null: false
      t.prefecture :integer, null: false
      t.delivery_date :integer, null: false
      t.status :integer, null: false
      t.likes_count :integer, default: 0
      t.timestamps null: false
    end
  end
end

# condition, delivery_cost, prefecture, delivery_date, statusは enum型をモデルで定義
