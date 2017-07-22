class AddBrandIdAndStoreIdToShoes < ActiveRecord::Migration[5.1]
  def change
    add_column(:shoes, :brand_id, :integer)
    add_column(:shoes, :store_id, :integer)
  end
end
