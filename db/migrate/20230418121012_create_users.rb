class CreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      t.string :is_active
      t.string :email
      t.string :password_digest
   
      t.timestamps
    end
  end
end