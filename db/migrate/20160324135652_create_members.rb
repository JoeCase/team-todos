class CreateMembers < ActiveRecord::Migration
  def change
    create_table :members do |t|
      t.string :first_name, null: false
      t.string :last_name, null: false
      t.string :email, null: false
      t.string :phone, null: false
      t.string :url, null: false

      t.references :user, null: false, index: true

      t.timestamps null: false
    end
  end
end
