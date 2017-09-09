class CreateTasks < ActiveRecord::Migration[5.1]
  def change
    create_table :tasks do |t|
	t.string "name"
	t.string "priority"
	t.string "status"
	t.date "due_date"
	t.text "description"
	t.integer "list_id"
	t.references :list, foreign_key: true
    t.timestamps
    end
  
  end
end
