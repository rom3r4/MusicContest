# frozen_string_literal: true

class WonLastContest
  prepend SimpleCommand

  def initialize(user_id)
    @user_id = user_id
  end

  def call
    last_contest
  end

  private

  def last_contest
    contest = MusicContest.where("date(now()) > end_date")
      .where(contest_status: "finished")
      .where(winner_user_id: @user_id).order("end_date DESC")[0]
    false if contest.nil?
    true
  end
end
