class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.string :firstname
      t.string :lastname
      t.string :callsign
      t.string :password_digest
      t.boolean :admin

      t.timestamps
    end
  end
end
