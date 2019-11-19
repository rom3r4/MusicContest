class MusicContestsController < ApplicationController
  before_action :set_music_contest, only: [:show, :update, :destroy]

  respond_to :json

  def index
    @music_contests = MusicContest.all
    respond_with(@music_contests)
  end

  def show
    respond_with(@music_contest)
  end

  def create
    @music_contest = MusicContest.new(music_contest_params)
    @music_contest.save
    respond_with(@music_contest)
  end

  def update
    @music_contest.update(music_contest_params)
    respond_with(@music_contest)
  end

  def destroy
    @music_contest.destroy
    respond_with(@music_contest)
  end

  private
  
  def set_music_contest
    @music_contest = MusicContest.find(params[:id])
  end

  def music_contest_params
    params.require(:music_contest).permit(:contest_status, :winner_user_id, :start_date, :end_date)
  end
end
