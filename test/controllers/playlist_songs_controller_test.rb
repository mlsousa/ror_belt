require 'test_helper'

class PlaylistSongsControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get playlist_songs_create_url
    assert_response :success
  end

  test "should get show" do
    get playlist_songs_show_url
    assert_response :success
  end

end
