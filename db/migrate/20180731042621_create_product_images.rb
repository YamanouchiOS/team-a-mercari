class CreateProductImages < ActiveRecord::Migration
  def change
    create_table :product_images do |t|
      t.image :string, null: false
      t.status :integer, null: false
      t.product_id :references, null: false, foreign_key: true
      t.timestamps null: false
    end
  end
end
