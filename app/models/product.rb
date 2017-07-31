class Product < ApplicationRecord
  has_one :info_on_student_portal, dependent: :destroy

  has_many :plans, dependent: :destroy
  has_many :courses
  has_many :notifications
  has_many :users, through: :products_users
  has_many :products_users, dependent: :destroy

  validates :code, uniqueness: true, length: {maximum: 50}
  validates :name, presence: true, length: {maximum: 255}
end
