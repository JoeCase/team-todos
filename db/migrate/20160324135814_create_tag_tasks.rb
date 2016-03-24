class CreateTagTasks < ActiveRecord::Migration
  def change
    create_table :tag_tasks do |t|

      t.references :tag, null: false, index: true
      t.references :task, null: false, index: true


      t.timestamps null: false
    end
  end
end
