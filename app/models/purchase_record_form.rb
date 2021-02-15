class PurchaseRecordForm

  include ActiveModel::Model
  attr_accessor :prefecture_id, :municipality, :street, :building, :post, :phone, :user_id, :item_id

  with_options presence: true do
    validates :prefecture_id, numericality: { other_than: 1, message: "can't be blank" }
    validates :municipality
    validates :street
    validates :post, format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)" }
    validates :phone, format: { with: /\A\d{10,11}\z/ }
    validates :user_id
    validates :item_id
  end

    def save
      purchase_record = PurchaseRecord.create(user_id: user_id, item_id: item_id)
      Address.create(post: post, phone: phone, prefecture_id: prefecture_id, municipality: municipality, street: street, building: building, purchase_record_id: purchase_record.id)
    end
end