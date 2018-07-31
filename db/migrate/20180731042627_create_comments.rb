class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.text :text, null: false
      t.user_id :references, null: false, foreign_key: true
      t.product_id :references, null: false, foreign_key: true
      t.timestamps null: false
    end
  end
end
