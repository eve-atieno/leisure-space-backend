class CreateGalleries < ActiveRecord::Migration[7.0]
  def change
    create_table :galleries do |t|
      t.string :image1
      t.string :image2
      t.string :image3
      t.string :image4
      t.string :image5
      t.belongs_to :space, null: false, foreign_key: true

      t.timestamps
    end
  end
end
