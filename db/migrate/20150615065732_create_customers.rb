class CreateCustomers < ActiveRecord::Migration
  def change
    create_table :customers do |t|
      t.string :first_name, null: false, default: ""
      t.string :last_name, null: false, default: ""
      t.string :company, null: false, default: ""
      t.string :phone1, null: false, default: ""
      t.string :phone2
      t.string :email, null: false, default: ""
      t.string :address, null: false, default: ""
      t.text :comment
      t.timestamps null: false
    end
  end
end
