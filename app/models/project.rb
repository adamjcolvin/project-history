class Project < ApplicationRecord
  STATES = %w[planning to_do in_progress testing done]
  enum :state, STATES.to_h { |r| [r, r] }

  has_many :comments, dependent: :destroy, after_add: :add_comment_to_history
  has_many :project_history_items, dependent: :destroy
  attr_accessor :current_user

  validates :title, :description, presence: true
  validates :state, inclusion: { in: STATES }

  after_initialize :set_default_state, if: :new_record?
  after_update :add_state_change_to_history, if: :saved_change_to_state?
  broadcasts

  def update(params)
    self.current_user = params.delete(:user)
    super(params)
  end

  private

    def add_state_change_to_history
      state_change = StateChange.new(
        from_state: saved_change_to_state.first,
        to_state: state,
        user: self.current_user,
      )
      if state_change.save
        project_history_items.create(historical: state_change)
      end
    end

    def add_comment_to_history(comment)
      project_history_items.create(historical: comment)
    end

    def set_default_state
      self.state ||= :planning
    end
end
