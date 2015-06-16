class CreateMessages < ActiveRecord::Migration
  def change
    create_table :messages do |t|
      t.references :user
      t.references :task
      t.string :description
      t.timestamps null: false
    end
  end
end
