class ProjectHistoryItem < ApplicationRecord
  belongs_to :project
  belongs_to :historical, polymorphic: true
end
