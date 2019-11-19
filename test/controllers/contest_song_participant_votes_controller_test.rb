require 'test_helper'

class ContestSongParticipantVotesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @contest_song_participant_vote = contest_song_participant_votes(:one)
  end

  test "should get index" do
    get contest_song_participant_votes_url, as: :json
    assert_response :success
  end

  test "should create contest_song_participant_vote" do
    assert_difference('ContestSongParticipantVote.count') do
      post contest_song_participant_votes_url, params: { contest_song_participant_vote: { participant_id: @contest_song_participant_vote.participant_id, song_id: @contest_song_participant_vote.song_id } }, as: :json
    end

    assert_response 201
  end

  test "should show contest_song_participant_vote" do
    get contest_song_participant_vote_url(@contest_song_participant_vote), as: :json
    assert_response :success
  end

  test "should update contest_song_participant_vote" do
    patch contest_song_participant_vote_url(@contest_song_participant_vote), params: { contest_song_participant_vote: { participant_id: @contest_song_participant_vote.participant_id, song_id: @contest_song_participant_vote.song_id } }, as: :json
    assert_response 200
  end

  test "should destroy contest_song_participant_vote" do
    assert_difference('ContestSongParticipantVote.count', -1) do
      delete contest_song_participant_vote_url(@contest_song_participant_vote), as: :json
    end

    assert_response 204
  end
end
