class CreateProjects < ActiveRecord::Migration[6.0]
  def change
    create_table :projects do |t|
      t.integer "user_id"
      t.string "email"
      t.string "name"
      t.string "description"
      t.boolean "visible", :default => false
      t.timestamps
    end
    add_index("projects","user_id")
  end
end
