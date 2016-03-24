class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.string :name, null: false
      t.integer :status, null: false
      t.integer :priority
      t.string  :due
      t.text    :notes
      t.string  :location

      t.references  :user, null: false, index: true
      t.references  :member, index: true
      t.references  :category, index: true


      t.timestamps null: false
    end
  end
end
