class StateChange < ApplicationRecord
  belongs_to :user
  has_one :project_history_item, as: :historical
end
