class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  has_one_attached :image
  belongs_to :user
  belongs_to :category
  belongs_to :item_status
  belongs_to :item_fee_status
  belongs_to :item_prefecture
  belongs_to :item_scheduled_delivery
  
  validates :image ,presence: true
  validates :name ,presence: true, length: {maximum: 40}
  validates :text ,presence: true, length: {maximum: 1000}
  validates :price, presence: true, inclusion: { in: 300..9999999,message: 'Out of setting range' }

    #カテゴリーの選択が「---」の時は保存できないようにするOut of setting range
    with_options numericality: { other_than: 1, message: "Select"} do
    validates :category_id
    validates :item_status_id
    validates :item_fee_status_id
    validates :item_prefecture_id
    validates :item_scheduled_delivery_id
  end
end
   



