class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :nickname, presence: true, length: { maximum: 6 }
  with_options presence: true, format: { with: /\A[ぁ-んァ-ン一-龥]/} do
    validates :first_name
    validates :last_name
  end

    with_options presence: true, format: { with: /\A[ァ-ヶー－]+\z/} do
    validates :first_name_kana
    validates :last_name_kana
  end

  validates :birthday, presence: true

  validates :password, format: { with: /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i}
  
end
