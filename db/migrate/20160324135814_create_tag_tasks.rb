class CreateTagTasks < ActiveRecord::Migration
  def change
    create_table :tag_tasks do |t|

      t.timestamps null: false
    end
  end
end
