class Plan < ApplicationRecord
  acts_as_paranoid

  belongs_to :product

  has_many :programs

  validates :name, presence: true
  validates :product_id, presence: true
end
