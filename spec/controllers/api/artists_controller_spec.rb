require 'rails_helper'

def createArtist
  Artist.create(name: "Nujabes", age: "31")
end

describe Api::ArtistsController do
  before do
    Artist.delete_all
  end
  describe 'GET index' do
    it 'returns http status ok' do
      get :index
      expect(response).to have_http_status(:ok)
    end
    it 'returns http status ok when get one movie data' do
      artist = create