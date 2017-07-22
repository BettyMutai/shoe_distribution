class Brand < ActiveRecord::Base
  has_many :shoes
  has_many :stores, through: :shoes
end
