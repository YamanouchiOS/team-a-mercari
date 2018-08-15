class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :buyer_products, class_name: 'Product', :foreign_key => 'buyer_id', dependent: :destroy
  has_many :user_products, class_name: 'Product', :foreign_key => 'user_id'

  has_many :likes, dependent: :destroy
  has_one :address
  has_many :comments
  accepts_nested_attributes_for :address
end
