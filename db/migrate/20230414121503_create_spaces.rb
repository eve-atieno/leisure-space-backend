class CreateSpaces < ActiveRecord::Migration[7.0]
  def change
    create_table :spaces do |t|
      t.string :name
      t.string :description
      t.string :image_url
      t.integer :price
      t.string :location

      t.timestamps
    end
  end
end
