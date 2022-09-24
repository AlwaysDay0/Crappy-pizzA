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
      expect(res