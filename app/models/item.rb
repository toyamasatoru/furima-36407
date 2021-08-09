class Item < ApplicationRecord
  validates :name, presence: true
  validates :information, presence: true
  validates :category_id, presence: true
  validates :status_id, presence: true
  validates :postage_id, presence: true
  validates :delivery_area_id, presence: true
  validates :delivery_schedule_id, presence: true
  validates :price, presence: true, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999 }, format: { with: /\A[0-9]+\z/ }
  validates :image, presence: true
  
  belongs_to :user
  has_one_attached :image
  
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :delivery_schedule
  # validates :delivery_schedule_id, numericality: { other_than: 1 }

  belongs_to :category
  # validates :category_id, numericality: { other_than: 1 }

  belongs_to :status
  # validates :status_id, numericality: { other_than: 1 }

  belongs_to :postage
  # validates :postage_id, numericality: { other_than: 1 }

  belongs_to :delivery_area
  # validates :delivery_area_id, numericality: { other_than: 1 }

  # 上記コメントアウトは、LGTM確認後に削除します。
  with_options  numericality: { other_than: 1 } do
    validates :delivery_schedule_id
    validates :category_id
    validates :status_id
    validates :postage_id
    validates :delivery_area_id
  end
end