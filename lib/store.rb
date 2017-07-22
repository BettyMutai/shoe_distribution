class Store < ActiveRecord::Base
  has_many :shoes
  has_many :brands, through: :shoes
end
