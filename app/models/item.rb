class Item < ApplicationRecord
  with_options presence: true do
    validates :name
    validates :information
    validates :price, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999 }, format: { with: /\A[0-9]+\z/ }
    validates :image
  end
  
  belongs_to :user
  has_one_attached :image
  
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :delivery_schedule
  belongs_to :category
  belongs_to :status
  belongs_to :postage
  belongs_to :delivery_area

  with_options numericality: { other_than: 1 } do
    validates :delivery_schedule_id
    validates :category_id
    validates :status_id
    validates :postage_id
    validates :delivery_area_id
  end
end
