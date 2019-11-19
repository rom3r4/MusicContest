# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2019_11_18_233811) do
  # These are extensions that must be enabled in order to support this database
  enable_extension 'plpgsql'

  create_table 'contest_song_participant_vote', id: :serial, force: :cascade do |t|
    t.integer 'participant_id'
    t.integer 'song_id'
  end

  create_table 'music_contest', id: :serial, force: :cascade do |t|
    t.string 'contest_status', limit: 10
    t.integer 'winner_user_id'
    t.date 'start_date'
    t.date 'end_date'
    t.index ['winner_user_id'], name: 'idx_contest_winner_user_id'
  end

  create_table 'participant', id: :serial, force: :cascade do |t|
    t.string 'name', limit: 100
    t.string 'surname', limit: 100
  end

  create_table 'song', id: :serial, force: :cascade do |t|
    t.string 'spotify_id', null: false
    t.string 'spotify_url'
    t.string 'spotify_title'
    t.string 'spotify_artist'
    t.integer 'spotify_length'
    t.string 'spotify_album'
    t.integer 'spotify_cover_id'
    t.integer 'contest_id'
    t.integer 'submitby_user_id', null: false
    t.index ['spotify_cover_id'], name: 'unq_song_spotify_cover_id', unique: true
    t.index ['submitby_user_id'], name: 'unq_song_submitby_user_id', unique: true
  end

  create_table 'song_cover', id: :serial, force: :cascade do |t|
    t.string 'file_path'
    t.string 'file_type'
    t.string 'file_url'
  end

  add_foreign_key 'contest_song_participant_vote', 'participant', name: 'fk_contest_song_participant_vote_participant'
  add_foreign_key 'contest_song_participant_vote', 'song', name: 'fk_contest_song_participant_vote_song'
  add_foreign_key 'music_contest', 'participant', column: 'winner_user_id', name: 'fk_contest_participant'
  add_foreign_key 'song', 'music_contest', column: 'contest_id', name: 'fk_song_contest'
  add_foreign_key 'song', 'participant', column: 'submitby_user_id', name: 'fk_song_participant'
  add_foreign_key 'song_cover', 'song', column: 'id', primary_key: 'spotify_cover_id', name: 'fk_song_cover_song'
end
