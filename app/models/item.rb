class Item < ApplicationRecord

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
  belongs_to_active_hash :condition
  belongs_to_active_hash :postage_type
  belongs_to_active_hash :preparation_day
  belongs_to_active_hash :ship_from
end
  belongs_to :user
  has_one_attached :image


  with_options presence: true do
    validates :name
    validates :category_id
    validates :condition_id
    validates :description
    validates :postage_type_id
    validates :preparation_day_id
    validates :ship_from_id
    validates :price
    validates :user
  end
end
