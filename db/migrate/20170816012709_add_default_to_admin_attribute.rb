class AddDefaultToAdminAttribute < ActiveRecord::Migration[5.1]
  def up
    change_column :users, :admin, :boolean, default: false
    change_column :users, :rank, :string, default: "Cadet"
  end

  def down
    change_column :users, :admin, :boolean, default: nil
    change_column :users, :rank, :string, default: nil
  end
end
