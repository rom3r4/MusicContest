# frozen_string_literal: true

class SongDeleteAllowed
  prepend SimpleCommand

  def initialize(user_id, song_id)
    @user_id = user_id
    @song_id = song_id
  end

  def call
    song_delete_allowed
  end

  private

  def song_delete_allowed
    @current_contest = CurrentContest.call

    raise ExceptionHandler::ContestNotFound, "Contest Not Found" unless
              @current_contest.success? || @current_contest.result.nil?

    (contest_is_active && song_belongs_to_user)
  end

  def contest_is_active
    @current_contest.result.contest_status == "active"
  end

  def song_belongs_to_user
    Song.find(@song_id).submitby_user_id == @user_id
  end
end
