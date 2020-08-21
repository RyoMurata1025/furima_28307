class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :image

  with_options presence: true do
    validates :name
    validates :information
    validates :category
    validates :status
    validates :delivery_fee
    validates :delivery_area
    validates :delivery_days
    validates :price, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999, message: "is out of setting range"}
    end
end
