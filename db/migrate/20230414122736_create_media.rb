class CreateMedia < ActiveRecord::Migration[7.0]
  def change
    create_table :media do |t|
      t.string :imageurl
      t.belongs_to :space, null: false, foreign_key: true

      t.timestamps
    end
  end
end
