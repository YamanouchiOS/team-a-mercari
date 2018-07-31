class LargeClass < ActiveRecord::Base
    has_many :product_categories, dependent: :destroy
    has_many :middle_classes, dependent: :destroy
end
