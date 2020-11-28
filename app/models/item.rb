class Item < ApplicationRecord

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
