class SmallClass < ActiveRecord::Base
    has_many :product_categories, dependent: :destroy
    belongs_to :middle_class
end
