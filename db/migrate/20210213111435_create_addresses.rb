class CreateAddresses < ActiveRecord::Migration[6.0]
  def change
    create_table :addresses do |t|
      t.references :purchase_record, foreign_key: true, null: false
      t.integer :prefecture_id, null: false
      t.string :municipality, null: false
      t.string :street, null: false
      t.string :building
      t.string :post, null: false
      t.string :phone, null: false


      t.timestamps
    end
  end
end
