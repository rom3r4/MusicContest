# frozen_string_literal: true

class WonLastContest
  prepend SimpleCommand

  def initialize(user_id)
    @user_id = user_id
  end

  def call
    won_last_contest
  end

  private

  def won_last_contest
    contest = MusicContest.where("date(now()) > end_date")
      .where(contest_status: "finished")
      .where(winner_user_id: @user_id).order("end_date DESC").first
    !contest.nil?
  end
end
