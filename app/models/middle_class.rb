class MiddleClass < ActiveRecord::Base
    has_many :product_categories, dependent: :destroy
    belongs_to :large_class
    has_many :small_classes, dependent: :destroy
end
