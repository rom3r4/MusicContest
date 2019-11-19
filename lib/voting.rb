# frozen_string_literal: true

module Voting
  class << self
    def date_in_range(start_date, end_date)
      current_date = DateTime.now
      current_date.between?(start_date, end_date)
    end

  end
end
