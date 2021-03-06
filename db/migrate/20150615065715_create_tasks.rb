class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.references :user
      t.references :customer
      t.string :sender, null: false
      t.string :from_address, null: false
      t.string :receiver, null: false
      t.string :to_address, null: false
      t.float :from_latitude
      t.float :from_longitude
      t.float :to_latitude
      t.float :to_longitude
      t.string :status, default: "new_task" #new, incomplete, completed, archived
      t.text :info
      t.datetime :accepted_time
      t.datetime :accomplished_time
      t.boolean :sign_required, default: false
      t.boolean :signed, default: false
      t.integer :item_count, default: 0
      t.timestamps null: false
    end
  end
end
