require 'test_helper'

class SongCoversControllerTest < ActionDispatch::IntegrationTest
  setup do
    @song_cover = song_covers(:one)
  end

  test "should get index" do
    get song_covers_url, as: :json
    assert_response :success
  end

  test "should create song_cover" do
    assert_difference('SongCover.count') do
      post song_covers_url, params: { song_cover: { file_path: @song_cover.file_path, file_type: @song_cover.file_type, file_url: @song_cover.file_url } }, as: :json
    end

    assert_response 201
  end

  test "should show song_cover" do
    get song_cover_url(@song_cover), as: :json
    assert_response :success
  end

  test "should update song_cover" do
    patch song_cover_url(@song_cover), params: { song_cover: { file_path: @song_cover.file_path, file_type: @song_cover.file_type, file_url: @song_cover.file_url } }, as: :json
    assert_response 200
  end

  test "should destroy song_cover" do
    assert_difference('SongCover.count', -1) do
      delete song_cover_url(@song_cover), as: :json
    end

    assert_response 204
  end
end
