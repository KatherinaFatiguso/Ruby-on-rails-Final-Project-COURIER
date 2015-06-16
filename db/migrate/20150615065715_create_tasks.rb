class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.references :user
      t.references :customer
      t.string :from_address, null: false
      t.string :to_address, null: false
      t.float :from_latitude
      t.float :from_longitude
      t.float :to_latitude
      t.float :to_longitude
      t.string :status, default: "new" #new, incomplete, completed, archived
      t.string :urgency, default: 1
      t.text :info
      t.datetime :start_time
      t.datetime :end_time
      t.boolean :sign_required?, default: false
      t.boolean :signed?, default: false
      t.integer :item_count, default: 0
      t.timestamps null: false
    end
  end
end
