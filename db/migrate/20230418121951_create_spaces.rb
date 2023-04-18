class CreateSpaces < ActiveRecord::Migration[7.0]
  def change
    create_table :spaces do |t|

      t.string :name
      t.string :description
      t.string :location
      t.integer :price
      t.references :admin, null: false, foreign_key: true


      t.timestamps
    end
  end
end
