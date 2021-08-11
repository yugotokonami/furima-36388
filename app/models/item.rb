class Item < ApplicationRecord

  with_options presence: true do
    validates :name
    validates :catch_copy
    validates :price

    validates :category_id, numericality: { other_than: 1 , message: "can't be blank"}
    validates :prefecture_id, numericality: { other_than: 1 , message: "can't be blank"}
    validates :state_id, numericality: { other_than: 1 , message: "can't be blank"}
    validates :postage_id, numericality: { other_than: 1 , message: "can't be blank"}
    validates :shipping_date_id, numericality: { other_than: 1 , message: "can't be blank"}
  end

  extend ActiveHash::Associations::ActiveRecordExtensions
    belongs_to :category
    belongs_to :prefecture
    belongs_to :state
    belongs_to :postage
    belongs_to :shipping_date

    belongs_to :user
    has_one_attached :image
end
