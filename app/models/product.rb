class Product < ActiveRecord::Base
  belongs_to :user, class_name: 'User', :foreign_key => 'user_id', counter_cache: :products_count
  belongs_to :buyer, class_name: 'User', :foreign_key => 'buyer_id'
  has_one :product_category, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :product_images, dependent: :destroy
  enum condition: { "新品、未使用": 0, "未使用に近い": 1, "目立った傷や汚れなし": 2, "やや傷や汚れあり": 3, "傷や汚れあり": 4, "全体的に状態が悪い": 5 }
  enum delivery_cost: { "送料込み(出品者負担)": 0, "着払い(購入者負担)": 1 }
  enum prefecture: { "北海道": 0, "青森県": 1, "岩手県": 2, "宮城県": 3, "秋田県": 4, "山形県": 5, "福島県": 6, "茨城県": 7, "栃木県": 8, "群馬県": 9, "埼玉県": 10, "千葉県": 11, "東京都": 12, "神奈川県": 13, "新潟県": 14, "富山県": 15, "石川県": 16, "福井県": 17, "山梨県": 18, "長野県": 19, "岐阜県": 20, "静岡県": 21, "愛知県": 22, "三重県": 23, "滋賀県": 24, "京都府": 25, "大阪府": 26, "兵庫県": 27, "奈良県": 28, "和歌山県": 29, "鳥取県": 30, "島根県": 31, "岡山県": 32, "広島県": 33, "山口県": 34, "徳島県": 35, "香川県": 36, "愛媛県": 37, "高知県": 38, "福岡県": 39, "佐賀県": 40, "長崎県": 41, "熊本県": 42, "大分県": 43, "宮崎県": 44, "鹿児島県": 45, "沖縄県": 46 }
  enum delivery_date: { "1~2日で発送": 0, "2~3日で発送": 1, "4~7日で発送": 2 }
  accepts_nested_attributes_for :product_images
  accepts_nested_attributes_for :product_category

  def self.fetch_pickup_categories(cat1)

    pickup1 = self.order('products.created_at DESC').includes(:product_category, :product_images).where("product_categories.large_class_id" => "#{cat1}").limit(4)
    return pickup1
  end

  def self.fetch_products_of_category(cat_cl, cat_id)
    if cat_cl == 1
      category_class = "large"
    elsif cat_cl == 2
      category_class = "middle"
    elsif cat_cl == 3
      category_class = "small"
    end

    products = self.order('products.created_at DESC').includes(:product_category, :product_images).where("product_categories.#{category_class}_class_id" => "#{cat_id}")
    return products
  end
end
