FactoryBot.define do
  factory :item do
    name {Faker::Name.initials(number: 2)}
    comment {Faker::Lorem.sentence}
    category_id {"2"}
    condition_id {"2"}
    postage_id {"2"}
    ship_form_id {"2"}
    etd_id {"2"}
    price {"400"}
    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/test_image/test_image.png'), filename: 'test_image.png')
    end
  end
end