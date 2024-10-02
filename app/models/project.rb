class Project < ApplicationRecord
  has_many :comments, dependent: :destroy
  enum state: %i[planning to_do in_progress testing done]
  after_initialize :set_default_state, if: :new_record?

  private

  def set_default_state
    self.state ||= :planning
  end
end
