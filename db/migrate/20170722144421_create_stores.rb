class CreateStores < ActiveRecord::Migration[5.1]
  def change
    create_table(:stores) do |t|
      t.column(:name, :string)
      t.column(:town, :string)
      t.column(:street, :string)

      t.timestamps()
    end
  end
end
