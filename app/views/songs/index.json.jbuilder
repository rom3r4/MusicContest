# frozen_string_literal: true

json.array! @songs, partial: "songs/song", as: :song
