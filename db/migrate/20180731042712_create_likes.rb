class CreateLikes < ActiveRecord::Migration
  def change
    create_table :likes do |t|
      t.user_id :references, null: false, foreign_key: true
      t.product_id :references, null: false, foreign_key: true
      t.timestamps null: false
    end
  end
end
