class RemoveNullFalseFromProductImages < ActiveRecord::Migration[5.0]
  def change
    change_column_null :product_images, :image, true
  end
end
