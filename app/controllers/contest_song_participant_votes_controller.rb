class ContestSongParticipantVotesController < ApplicationController
  before_action :set_contest_song_participant_vote, only: [:show, :update, :destroy]

  respond_to :json

  def index
    @contest_song_participant_votes = ContestSongParticipantVote.all
    respond_with(@contest_song_participant_votes)
  end

  def show
    respond_with(@contest_song_participant_vote)
  end

  def create
    @contest_song_participant_vote = ContestSongParticipantVote.new(contest_song_participant_vote_params)
    @contest_song_participant_vote.save
    respond_with(@contest_song_participant_vote)
  end

  def update
    @contest_song_participant_vote.update(contest_song_participant_vote_params)
    respond_with(@contest_song_participant_vote)
  end

  def destroy
    @contest_song_participant_vote.destroy
    respond_with(@contest_song_participant_vote)
  end

  private
    def set_contest_song_participant_vote
      @contest_song_participant_vote = ContestSongParticipantVote.find(params[:id])
    end

    def contest_song_participant_vote_params
      params.require(:contest_song_participant_vote).permit(:participant_id, :song_id)
    end
end
