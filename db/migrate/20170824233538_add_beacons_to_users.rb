class AddBeaconsToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :beacons, :string, array: true, default: []
  end
end
