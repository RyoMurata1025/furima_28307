class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  with_options presence: true do
    validates :nickname
    validates :password, format: { with: /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i}, confirmation: true
    validates :family_name, format: { with: /\A[ぁ-んァ-ン一-龥]/}
    validates :first_name, format: { with: /\A[ぁ-んァ-ン一-龥]/}
    validates :family_name_kana, format: { with: /\A[ァ-ヶー－]+\z/}
    validates :first_name_kana, format: { with: /\A[ァ-ヶー－]+\z/}
    validates :birth_day
    end

    validates :email, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/}
      # inclusion: { in: ["@"] }なぜかエラーが出る為禁止
      # uniqueness: {case_sensitive: true}, 一意性のバリデーション。devise標準搭載されている為いらない
      # presence: trueに関しては標準装備
end
