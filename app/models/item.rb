class Item < ApplicationRecord

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
  belongs_to_active_hash :condition
  belongs_to_active_hash :postage_type
  belongs_to_active_hash :preparation_day
  belongs_to_active_hash :ship_from

  belongs_to :user
  has_one_attached :image


  with_options presence: true do
    validates :name
    validates :description

    validates :price
    validates :user
  end

    validates :category_id, numericality: { other_than: 0 }
    validates :condition_id, numericality: { other_than: 0 }
    validates :postage_type_id, numericality: { other_than: 0 }
    validates :preparation_day_id, numericality: { other_than: 0 }
    validates :ship_from_id, numericality: { other_than: 0 }
end
