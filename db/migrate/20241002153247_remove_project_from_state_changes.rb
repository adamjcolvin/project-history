class RemoveProjectFromStateChanges < ActiveRecord::Migration[7.2]
  def change
    remove_reference :state_changes, :project, null: false, foreign_key: true
  end
end
