class ProductCategory < ActiveRecord::Base
    belongs_to :product
    belongs_to :large_class
    belongs_to :middle_class
    belongs_to :small_class
end
