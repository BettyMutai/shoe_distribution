class CreateShoes < ActiveRecord::Migration[5.1]
  def change
    create_table(:shoes) do |t|
      t.column(:image, :varchar)
      t.column(:size, :string)
      t.column(:cost, :integer)

      t.timestamps()
    end
  end
end
