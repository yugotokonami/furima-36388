class Item < ApplicationRecord

  with_options presence: true do
    validates :name
    validates :catch_copy
    validates :price
    validates :state_id
    validates :postage_id
    validates :prefecture_id
    validates :shipping_date_id
  end

    validates :category_id, numericality: { other_than: 1 , message: "can't be blank"}

    extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :user
end
