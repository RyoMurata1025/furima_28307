class BuyerAddress

  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :postal_code, :prefecture_id, :city, :house_number, :building_name, :phone_number


  def save
    buyer = Buyer.create(user_id: )
  end

end