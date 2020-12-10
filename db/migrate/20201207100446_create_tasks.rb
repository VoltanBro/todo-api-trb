class CreateTasks < ActiveRecord::Migration[6.0]
  def change
    create_table :tasks do |t|
      t.string :name, null: false
      t.boolean :complited, default: false
      t.date :due_date, null: false
      t.references :project, index: true, foreign_key: true

      t.timestamps
    end
  end
end
