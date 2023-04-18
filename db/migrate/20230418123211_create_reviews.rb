class CreateReviews < ActiveRecord::Migration[7.0]
  def change
    create_table :reviews do |t|

      t.integer :rating
      t.string :comment
      t.references :space, null: false, foreign_key: true
      t.references :profile, null: false, foreign_key: true


      t.timestamps
    end
  end
end
