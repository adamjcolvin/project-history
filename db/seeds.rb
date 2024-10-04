ENV["SEEDING"] = "true"

adam = User.find_or_create_by!(email: 'adam@techtest.com') do |user|
  user.password = 'password'
  user.password_confirmation = 'password'
  user.first_name = 'Adam'
  user.last_name = 'Colvin'
end

homey = User.find_or_create_by!(email: 'homey@techtest.com') do |user|
  user.password = 'password'
  user.password_confirmation = 'password'
  user.first_name = 'Homey'
  user.last_name = 'Admin'
end

project = Project.find_or_create_by!(title: 'Project Alpha') do |project|
  project.description = 'This is the first project.'
  project.state = :planning
end

history_data = YAML.load_file(Rails.root.join('db', 'project_history.yml'))
history_data['history'].each do |history_item|
  if history_item['question']
    question = history_item['question']
    project.comments.find_or_create_by!(content: question, user: adam)
  elsif history_item['answer']
    answer = history_item['answer']
    project.comments.find_or_create_by!(content: answer, user: homey)
  elsif history_item['state']
    state = history_item['state']
    project.update(state: state, user: adam)
  end
end

ENV["SEEDING"] = nil
