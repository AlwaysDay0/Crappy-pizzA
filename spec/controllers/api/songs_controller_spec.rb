require 'rails_helper'

describe Api::SongsController do
  before do
    @song = Song.create(
      title: "Song1",
      duration: 4,
      rating: 10,
      progress: 3
    )
  end
  
  # GET /api/songs/
  describe 'GET index' do
    it 'returns http status ok' do
      get :index
      expect(response).to have_http_status(:ok)
    end
    
    it 'render json with all songs' do
      get :index
      songs = JSON.parse(response.body)
      expect(songs.size).to eq 1
      expect(songs[0]["id"]).to eq @song.id
    end
  end
  
  # GET /api/songs/:id
  describe 'GET show' do
    it 'returns http status ok' do
      get :show, params: { id: @song }
      expect(response).to have_http_status(:ok)
    end

    it 'render the correct @song' do
        get :show, params: { id: @song }
        expected_song = JSON.parse(response.body)
        expect(expected_song["id"]).to eq(@song.id)
    end
  end

  # GET /api/songs/:id/artists
  describe 'GET artists' do
    it 'returns http status ok' do
      get :artists, params: { song_id: @song }
      expect(response).to have_http_status(:ok)
    end

    it 'render the correct artists' do
        @song.artists << Artist.create(name: "MAluma")
        get :artists, params: { song_id: @song }
    