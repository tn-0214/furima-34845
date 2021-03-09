class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  has_one_attached :image
  belongs_to :user
  belongs_to :ship_form
  belongs_to :condition
  belongs_to :category
  belongs_to :etd
  belongs_to :postage

  with_options presence: true, numericality: { other_than: 1 }  do
    validates :category_id
    validates :condition_id
    validates :postage_id
    validates :ship_form_id
    validates :etd_id
  end

  validates :price, presence: true, numericality: {:greater_than_or_equql_to => 300, :less_than_or_equal_to => 9999999}, format: { with: /\A[0-9]+\z/, message: '半角数字を使用してください' } 

  validates :image, presence: true

end