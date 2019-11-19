class Contest < ApplicationRecord
  self.table_name = 'contest'

  belongs_to :participant, class_name: 'Participant', foreign_key: :winner_user_id
  has_many :songs, class_name: 'Song'
end
