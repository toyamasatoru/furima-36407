FactoryBot.define do
  factory :item do
    name                  {"商品"}
    information           {"今季の新作です"}
    category_id           {2}
    status_id             {2}
    postage_id            {2}
    delivery_area_id      {2}
    delivery_schedule_id  {2}
    price                 {5000}
  end
end