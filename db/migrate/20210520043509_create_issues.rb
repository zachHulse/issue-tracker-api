class CreateIssues < ActiveRecord::Migration[6.1]
  def change
    create_table :issues do |t|
      t.references :project, null: false, foreign_key: true
      t.references :sprint, null: true, foreign_key: true
      t.string :name
      t.string :description
      t.integer :story_points
      t.string :code

      t.timestamps
    end
  end
end
