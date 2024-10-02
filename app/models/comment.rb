class Comment < ApplicationRecord
  belongs_to :project
  belongs_to :user
  has_many :project_history_items, as: :historical
end
