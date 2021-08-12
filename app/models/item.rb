class Item < ApplicationRecord

  with_options presence: true do
    validates :name
    validates :catch_copy
    validates :price, inclusion: { in: 300..9_999_999, message: 'は¥300~¥9,999,999の間を設定してください'}, format: { with: /\A[0-9]+\z/, message: 'は半角数字を使用してください'}
    validates :image

    with_options numericality: { other_than: 1 , message: "can't be blank"} do
      validates :category_id
      validates :prefecture_id
      validates :state_id
      validates :postage_id
      validates :shipping_date_id
    end
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
