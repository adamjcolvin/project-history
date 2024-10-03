module StateChangesHelper
  def state_change_description(state_change)
    from_state = t("project.states.#{state_change.from_state}")
    to_state = t("project.states.#{state_change.to_state}")
    "#{user_full_name(state_change.user)} changed the state from #{from_state} to #{to_state}"
  end
end
