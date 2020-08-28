class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  rege_user_x = /\A[ぁ-んァ-ン一-龥]/
  rege_user_y = /\A[ァ-ヶー－]+\z/


  with_options presence: true do
    validates :nickname
    validates :password, format: { with: /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i}, confirmation: true
    validates :family_name, format: { with: rege_user_x}
    validates :first_name, format: { with: rege_user_x}
    validates :family_name_kana, format: { with: rege_user_y}
    validates :first_name_kana, format: { with: rege_user_y}
    validates :birth_day
    end

  validates :email, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/}
      # inclusion: { in: ["@"] }なぜかエラーが出る為禁止
      # uniqueness: {case_sensitive: true}, 一意性のバリデーション。devise標準搭載されている為いらない
      # presence: trueに関しては標準装備

  has_many :items
  has_many :buyers
end
