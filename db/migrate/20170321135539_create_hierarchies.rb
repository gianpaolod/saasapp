class CreateHierarchies < ActiveRecord::Migration[5.0]
  def change
    create_table :hierarchies do |t|
      t.string :name
      t.integer :level
      t.timestamps
    end
  end
end
