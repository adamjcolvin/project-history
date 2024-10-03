module ProjectsHelper
  def user_full_name(user)
    return "Anon" if user.first_name.blank? && user.last_name.blank?

    "#{user.first_name} #{user.last_name}"
  end
end
