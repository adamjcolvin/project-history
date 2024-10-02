require "test_helper"

class ProjectTest < ActiveSupport::TestCase
  test "project state defaults to planning" do
    project = Project.new
    assert_equal "planning", project.state
  end
end
