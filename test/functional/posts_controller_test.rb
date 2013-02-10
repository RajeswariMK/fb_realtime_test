require 'test_helper'

class PostsControllerTest < ActionController::TestCase
  setup do
    @post = posts(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:posts)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create post" do
    assert_difference('Post.count') do
      post :create, post: { caption: @post.caption, comments_count: @post.comments_count, created_time: @post.created_time, description: @post.description, facebook_infos_id: @post.facebook_infos_id, fb_post_id: @post.fb_post_id, fb_updated_time: @post.fb_updated_time, likes_count: @post.likes_count, link_url: @post.link_url, message: @post.message, name: @post.name, picture_url: @post.picture_url, post_type: @post.post_type, source: @post.source }
    end

    assert_redirected_to post_path(assigns(:post))
  end

  test "should show post" do
    get :show, id: @post
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @post
    assert_response :success
  end

  test "should update post" do
    put :update, id: @post, post: { caption: @post.caption, comments_count: @post.comments_count, created_time: @post.created_time, description: @post.description, facebook_infos_id: @post.facebook_infos_id, fb_post_id: @post.fb_post_id, fb_updated_time: @post.fb_updated_time, likes_count: @post.likes_count, link_url: @post.link_url, message: @post.message, name: @post.name, picture_url: @post.picture_url, post_type: @post.post_type, source: @post.source }
    assert_redirected_to post_path(assigns(:post))
  end

  test "should destroy post" do
    assert_difference('Post.count', -1) do
      delete :destroy, id: @post
    end

    assert_redirected_to posts_path
  end
end
