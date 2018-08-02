class CreateProductImages < ActiveRecord::Migration
  def change
    create_table :product_images do |t|
      t.string :image, null: false
      t.integer :status, null: false
      t.references :product, null: false, foreign_key: true
      t.timestamps null: false
    end
  end
end
