class Product < ActiveRecord::Base
    belongs_to :user, counter_cache: :products_count
    has_one :product_category, dependent: :destroy
    has_many :comments, dependent: :destroy
    has_many :likes, dependent: :destroy
    has_many :product_images, dependent: :destroy
end
