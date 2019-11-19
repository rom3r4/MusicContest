json.extract! song_cover, :id, :file_path, :file_type, :file_url
json.url song_cover_url(song_cover, format: :json)
