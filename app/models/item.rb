class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  
  belongs_to :user
  has_one_attached :image
  belongs_to_active_hash :category
  belongs_to_active_hash :status
  belongs_to_active_hash :delivery_fee
  belongs_to_active_hash :delivery_area
  belongs_to_active_hash :delivery_days
  has_one :buyer

  with_options presence: true do
    validates :image
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
