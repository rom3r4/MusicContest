# frozen_string_literal: true

json.extract! participant, :id, :name, :surname
json.url participant_url(participant, format: :json)
