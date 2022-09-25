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
      expect(son