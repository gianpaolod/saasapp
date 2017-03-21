class AddHierarchyToUser < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :hierarchi_id, :integer
  end
end
