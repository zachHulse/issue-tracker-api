class CreateSprints < ActiveRecord::Migration[6.1]
  def change
    create_table :sprints do |t|
      t.references :project, null: false, foreign_key: true
      t.date :start
      t.date :finish

      t.timestamps
    end
  end
end
