FactoryBot.define do
  factory :user do
    nickname              {Faker::Name.initials(number: 2)}
    first_name {'竜士'}
    last_name {'増田'}
    first_name_kana {'リュウジ'}
    last_name_kana {'マスダ'}
    birthday {'2000-02-10'}
    email                 {Faker::Internet.free_email}
    password              {Faker::Internet.password(min_length: 6) + '1a'}
    password_confirmation {password}
  end
end