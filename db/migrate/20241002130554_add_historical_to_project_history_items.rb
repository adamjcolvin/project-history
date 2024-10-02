class AddHistoricalToProjectHistoryItems < ActiveRecord::Migration[7.2]
  def change
    add_reference :project_history_items, :historical, polymorphic: true, null: false
  end
end
