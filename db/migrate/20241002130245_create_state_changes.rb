class CreateStateChanges < ActiveRecord::Migration[7.2]
  def change
    create_table :state_changes do |t|
      t.references :project, null: false, foreign_key: true
      t.string :from_state
      t.string :to_state
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
