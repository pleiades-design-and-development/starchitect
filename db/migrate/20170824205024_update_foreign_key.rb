class UpdateForeignKey < ActiveRecord::Migration[5.1]
  def change
    # remove the old foreign_key
    remove_foreign_key :submissions, :users

    # add the new foreign_key
    add_foreign_key :submissions, :users, on_delete: :cascade
  end
end
