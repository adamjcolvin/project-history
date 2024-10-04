class ProjectHistoryItem < ApplicationRecord
  include ActionView::RecordIdentifier
  belongs_to :project
  belongs_to :historical, polymorphic: true

  after_create_commit :stream_to_project, unless: :seeding?

  private

    def stream_to_project
      broadcast_replace_to project,
        target: "#{dom_id(project)}_project_history_items",
        partial: "projects/project_history_items",
        locals: { project: project }
    end

    def seeding?
      ENV["SEEDING"] == "true"
    end
end
