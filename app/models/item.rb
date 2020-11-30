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
    validates :image
    validates :price, format: { with: /\A[0-9]+\z/, message: 'half-width number' }
    validates :user
  end

  with_options presence: true do
    validates :category_id, numericality: { other_than: 0, message: 'select'  }
    validates :condition_id, numericality: { other_than: 0, message: 'select' }
    validates :postage_type_id, numericality: { other_than: 0, message: 'select' }
    validates :preparation_day_id, numericality: { other_than: 0, message: 'select' }
    validates :ship_from_id, numericality: { other_than: 0, message: 'select' }
  end

  validates :price, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999, message: 'is out of setting range' }
end
