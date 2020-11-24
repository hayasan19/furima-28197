class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  has_one_attached :image
  belongs_to :category
  belongs_to :item_status
  belongs_to :item_fee_status
  belongs_to :item_prefecture
  belongs_to :item_scheduled_delivery

    with_options presence: true do
    validates :name
    validates :text 
    validates :price
    end

    #カテゴリーの選択が「---」の時は保存できないようにする
    with_options presence: true, numericality: { other_than: 1} do
    validates :category_id
    validates :item_status_id
    validates :item_fee_status_id
    validates :item_prefecture_id
    validates :item_scheduled_delivery_id
    end
    
  end

