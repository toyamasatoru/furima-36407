FactoryBot.define do
  factory :purchase_delivery do
    postal_code             {"123-4567"}
    delivery_area           {2}
    city                    {"板橋区"}
    address                 {"111"}
    building                {"マンション111"}
    phone                   {"09011118888"}
    token {"tok_abcdefghijk00000000000000000"}
  end
end
