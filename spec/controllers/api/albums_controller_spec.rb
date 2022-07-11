
require 'rails_helper'

RSpec.describe Api::AlbumsController, type: :controller do
  
  before do
    @artist_1 = Artist.create(
      name: "Artist 1",
      age: 12
    )
    @song_1 = Song.create(
      title: "Song 1",
      duration: 5,
      rating: 1,
      progress: 1
    )
    @album = Album.create(
      title: "Title - 1",
      rating: 2
    )
    @album.artists << @artist_1
    @album.songs << @song_1
  end

  # List of albums
  describe 'GET index' do
    it 'returns http status ok' do
      get :index