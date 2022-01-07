class Category < ActiveRecord::Base

  has_many :products

  validates :name, length: 3..20
end
