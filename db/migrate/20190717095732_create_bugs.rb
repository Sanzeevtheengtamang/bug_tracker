class CreateBugs < ActiveRecord::Migration[6.0]
  def change
    create_table :bugs do |t|
      t.integer "project_id"
      t.string "bug_name"
      t.string "bug_description"      
      t.integer "status"
      t.timestamps
    end
    add_index("bugs","project_id")
  end
end
