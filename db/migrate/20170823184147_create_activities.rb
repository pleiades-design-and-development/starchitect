class CreateActivities < ActiveRecord::Migration[5.1]
  def change
    create_table :activities do |t|
      t.belongs_to :user, foreign_key: true
      t.string :action
      t.belongs_to :trackable, foreign_key: true
      t.string :trackable_type

      t.timestamps
    end
  end
end
