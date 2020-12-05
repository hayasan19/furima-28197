class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  has_one_attached :image
  belongs_to :user
  belongs_to :category
  belongs_to :item_status
  belongs_to :item_fee_status
  belongs_to :item_prefecture
  belongs_to :item_scheduled_delivery
  
  with_options presence: true do
  validates :image
  end

  with_options presence: true, length: {maximum: 40} do
  validates :name
  end

  with_options presence: true, length: {maximum: 1000} do
  validates :text
  end
  
  with_options presence: true, inclusion: { in: 300..9999999,message: 'Out of setting range' } do
  validates :price
end

    #カテゴリーの選択が「---」の時は保存できないようにするOut of setting range
    with_options numericality: { other_than: 1, message: "Select"} do
    validates :category_id
    validates :item_status_id
    validates :item_fee_status_id
    validates :item_prefecture_id
    validates :item_scheduled_delivery_id
  end
end
   



