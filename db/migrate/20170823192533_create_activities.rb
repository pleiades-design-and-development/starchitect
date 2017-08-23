class CreateActivities < ActiveRecord::Migration[4.2]
  def change
    create_table :activities do |t|
      t.belongs_to :user, foreign_key: true
      t.string :action
      t.references :trackable, polymorphic: true
      t.string :trackable_type

      t.timestamps
    end
    add_index :activities, :user_id
    add_index :activities, :trackable_id
  end
end
