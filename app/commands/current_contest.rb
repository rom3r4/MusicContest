# frozen_string_literal: true

class CurrentContest
  prepend SimpleCommand

  def initialize; end

  def call
    current_contest
  end

  private

  def current_contest
    contest = MusicContest.where("date(now()) between start_date and end_date")
                    .where(contest_status: "active").order("start_date DESC")[0]              
    contest
  end
end
