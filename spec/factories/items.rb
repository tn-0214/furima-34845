FactoryBot.define do
  factory :item do
    name {Faker::Name.initials(number: 2)}
    last_name {"山田"}
    first_name {"太郎"}
    last_name_kana {"ヤマダ"}
    first_name_kana {"タロウ"}
    email {Faker::Internet.free_email}
    password = "abc123"
    password {password}
    password_confirmation {password}
    birthday {Faker::Date.backward}
  end
end