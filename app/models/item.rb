class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  has_one_attached :image
  belongs_to :user
  belongs_to :ship_form
  belongs_to :condition
  belongs_to :category
  belongs_to :etd
  belongs_to :postage
  belongs_to :purchase ,optional: true

  with_options presence: true, numericality: { other_than: 1 }  do
    validates :category_id
    validates :condition_id
    validates :postage_id
    validates :ship_form_id
    validates :etd_id
  end

  validates :price, presence: true, numericality: { only_integer: true,message:'半角数字を使用してください' },inclusion: { in: 300..9999999 }
  

  with_options presence: true do
    validates :name
    validates :comment
    validates :image
  end

end