FactoryBot.define do
  factory :destination_purchase do
    token {"tok_abcdefghijk00000000000000000"}
    postal_code {"123-4567"}
    ship_form_id {48}
    city {"那覇市"}
    address {"古島1-1-1"}
    phone_number {"09000000000"}

  end
end
