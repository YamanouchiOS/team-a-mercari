class SmallClass < ActiveRecord::Base
    has_many :product_cateogries, dependent: :destroy
    belongs_to :middle_classes
end
