class CreateProductCategories < ActiveRecord::Migration
  def change
    create_table :product_categories do |t|
      t.product_id :references, null: false, foreign_key: true
      t.large_class_id :references, null: false, foreign_key: true
      t.middle_class_id :references, null: false, foreign_key: true
      t.small_class_id :references, null: false, foreign_key: true
      t.timestamps null: false
    end
  end
end
