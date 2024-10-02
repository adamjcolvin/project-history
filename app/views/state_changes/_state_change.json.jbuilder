json.extract! state_change, :id, :project_id, :from_state, :to_state, :user_id, :created_at, :updated_at
json.url state_change_url(state_change, format: :json)
