module ArtistsHelper
  def display_artist(song)
    song.artist.nil? ? link_to("Add Artist", edit_song_path(song)) : link_to(song.artist_name, artist_path(song.artist))
  end

  def artist_select(song)
    if song.artist.nil? # if song has no artist
      select_tag "song[artist_id]", options_from_collection_for_select(Artist.all, :id, :name)  #create dropdown to select one
    else # collect artist_id with hidden input
      hidden_field_tag "song[artist_id]", song.artist_id
    end

  end
end
