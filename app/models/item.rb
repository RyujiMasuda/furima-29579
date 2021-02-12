class Item < ApplicationRecord

  has_one_attached :image
  belongs_to :user

  with_options presence: true,numericality: { other_than: 1, message: 'select'}  do
    validates :category_id
    validates :condition_id
    validates :prefecture_id
    validates :day_id
    validates :delivery_fee_id
  end

  with_options presence: true do
    validates :name
    validates :text
    validates :image
  end

  validates :price, presence: true, format: { with: /\A[0-9]+\z/}, numericality: {greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999}

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :condition
  belongs_to :day
  belongs_to :delivery_fee
  belongs_to :prefecture

end