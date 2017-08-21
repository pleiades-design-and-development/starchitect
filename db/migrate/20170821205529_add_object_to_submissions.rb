class AddObjectToSubmissions < ActiveRecord::Migration[5.1]
  def change
    add_column :submissions, :object, :string
  end
end
