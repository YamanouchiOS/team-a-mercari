class ProductCategory < ActiveRecord::Base
    belongs_to :product, :large_class, :middle_class, small_class
end
