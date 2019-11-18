class InitializeSchema < ActiveRecord::Migration[5.2]

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "contest", id: :serial, force: :cascade do |t|
    t.string "contest_status", limit: 1
    t.integer "winner_user_id"
    t.date "start_date"
    t.date "end_date"
    t.index ["winner_user_id"], name: "idx_contest_winner_user_id"
  end

  create_table "contest_song_participant_vote", id: :serial, force: :cascade do |t|
    t.integer "participant_id"
    t.integer "song_id"
  end

  create_table "participant", id: :serial, force: :cascade do |t|
    t.string "name", limit: 100
    t.string "surname", limit: 100
  end

  create_table "song", id: :serial, force: :cascade do |t|
    t.string "spotify_id", null: false
    t.string "spotify_url"
    t.string "spotify_title"
    t.string "spotify_artist"
    t.integer "spotify_length"
    t.string "spotify_album"
    t.integer "spotify_cover_id"
    t.integer "contest_id"
    t.integer "submitby_user_id"
    t.index ["spotify_cover_id"], name: "unq_song_spotify_cover_id", unique: true
    t.index ["submitby_user_id"], name: "unq_song_submitby_user_id", unique: true
  end

  create_table "song_cover", id: :serial, force: :cascade do |t|
    t.string "file_path"
    t.string "file_type"
    t.string "file_url"
  end

  add_foreign_key "contest", "participant", column: "winner_user_id", name: "fk_contest_participant"
  add_foreign_key "contest_song_participant_vote", "participant", name: "fk_contest_song_participant_vote_participant"
  add_foreign_key "contest_song_participant_vote", "song", name: "fk_contest_song_participant_vote_song"
  add_foreign_key "song", "contest", name: "fk_song_contest"
  add_foreign_key "song_cover", "song", column: "id", primary_key: "spotify_cover_id", name: "fk_song_cover_song"

end
