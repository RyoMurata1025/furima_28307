class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  
  belongs_to :user
  has_one_attached :image
  belongs_to_active_hash :category

  with_options presence: true do
    validates :name
    validates :information
    validates :category_id
    validates :status_id
    validates :delivery_fee_id
    validates :delivery_area_id
    validates :delivery_days_id
    validates :price, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999, message: "is out of setting range"}
    end
end
