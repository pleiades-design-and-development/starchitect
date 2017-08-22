class ChangeColumnNameAgain < ActiveRecord::Migration[5.1]
  def change
      rename_column :submissions, :object, :submit_object
  end
end
