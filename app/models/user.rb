class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :products, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_one :address
  has_many :comments
  accepts_nested_attributes_for :address
end
