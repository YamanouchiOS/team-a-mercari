class CreateProductCategories < ActiveRecord::Migration
  def change
    create_table :product_categories do |t|
      t.references :product, null: false, foreign_key: true
      t.references :large_class, null: false, foreign_key: true
      t.references :middle_class, null: false, foreign_key: true
      t.references :small_class, null: false, foreign_key: true
      t.timestamps
    end
  end
end
