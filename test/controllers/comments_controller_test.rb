require "test_helper"

class CommentsControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers

  setup do
    @comment = comments(:one)
    sign_in @comment.user
  end

  test "should get index" do
    get project_comments_url(@comment.project)
    assert_response :success
  end

  test "should create comment" do
    assert_difference("Comment.count") do
      post project_comments_url(@comment.project), params: { comment: { content: @comment.content } }
    end
  end

  test "should show comment" do
    get project_comment_url(@comment.project, @comment)
    assert_response :success
  end

  test "should get edit" do
    get edit_project_comment_url(@comment.project, @comment)
    assert_response :success
  end

  test "should update comment" do
    patch project_comment_url(@comment.project, @comment), params: { comment: { content: @comment.content, project_id: @comment.project_id, user_id: @comment.user_id } }
    assert_redirected_to project_comment_url(@comment.project, @comment)
  end

  test "should destroy comment" do
    assert_difference("Comment.count", -1) do
      delete project_comment_url(@comment.project, @comment)
    end
  end
end
