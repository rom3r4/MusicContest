# frozen_string_literal: true

json.extract! music_contest, :id, :contest_status, :winner_user_id, :start_date, :end_date
json.url music_contest_url(music_contest, format: :json)
