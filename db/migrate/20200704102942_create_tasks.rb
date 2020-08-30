class CreateTasks < ActiveRecord::Migration[5.1]
  def change
    create_table :tasks do |t|
      t.string :text
      t.references :project, foreign_key: true
      t.boolean :complete, null: false, default: false
      t.date :deadline

      t.timestamps
    end
  end
end
