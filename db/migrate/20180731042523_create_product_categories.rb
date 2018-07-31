class CreateProductCategories < ActiveRecord::Migration
  def change
    create_table :product_categories do |t|
      t.references :product_id, null: false, foreign_key: true
      t.references :large_class_id, null: false, foreign_key: true
      t.references :middle_class_id, null: false, foreign_key: true
      t.references :small_class_id, null: false, foreign_key: true
      t.timestamps null: false
    end
  end
end
