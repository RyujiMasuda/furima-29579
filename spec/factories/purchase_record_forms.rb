FactoryBot.define do
  factory :purchase_record_form do
    token {"tok_abcdefghijk00000000000000000"}
    prefecture_id {2}
    municipality {"世田谷区奥沢"}
    street {"7-40-24"}
    building {}
    post {"123-4567"}
    phone {"08043873210"}
  end
end
