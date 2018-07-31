class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.text :text, null: false
      t.references :user_id, null: false, foreign_key: true
      t.references :product_id, null: false, foreign_key: true
      t.timestamps null: false
    end
  end
end
