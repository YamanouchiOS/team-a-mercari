class CreateLikes < ActiveRecord::Migration
  def change
    create_table :likes do |t|
      t.references :user_id, null: false, foreign_key: true
      t.references :product_id, null: false, foreign_key: true
      t.timestamps null: false
    end
  end
end
