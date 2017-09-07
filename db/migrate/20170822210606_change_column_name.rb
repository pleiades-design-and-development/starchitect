class ChangeColumnName < ActiveRecord::Migration[5.1]
  def change
    rename_column :submissions, :type, :submit_type
  end
end
