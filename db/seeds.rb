# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

User.find_or_create_by!(email: 'adam@techtest.com') do |user|
  user.password = 'password'
  user.password_confirmation = 'password'
  user.first_name = 'Adam'
  user.last_name = 'Colvin'
end

User.find_or_create_by!(email: 'homey@techtest.com') do |user|
  user.password = 'password'
  user.password_confirmation = 'password'
  user.first_name = 'Homey'
  user.last_name = 'Admin'
end

project = Project.find_or_create_by!(title: 'Project Alpha') do |project|
  project.description = 'This is the first project.'
  project.state = :planning
end
