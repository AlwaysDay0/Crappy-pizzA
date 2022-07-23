
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
      expect(response).to have_http_status(:ok)
    end
    it 'render json with all albums' do
      get :index
      albums = JSON.parse(response.body)
      expect(albums.size).to eq 1
    end
    it 'returns http status ok when get one album data' do
      get :index, params: {id: @album.id}
      expect(response).to have_http_status(:ok)
    end
  end

  # Album's detail
  describe 'GET show' do
    it 'returns http status ok' do
      get :show, params: { id: @album }
      expect(response).to have_http_status(:ok)
    end
    it 'render the correct album' do
      get :show, params: { id: @album }
      expected_album = JSON.parse(response.body)
      expect(expected_album["id"]).to eq(@album.id)
    end
    it 'returns http status not found' do
      get :show, params: { id: 'xxx' }
      expect(response).to have_http_status(:not_found)
    end
  end

  # Show artists for album
  describe 'GET show artists for album' do
    it 'returns http status ok' do
      get :show, params: { 
        id: @album.id,
        resource: "artists"
      }
      expect(response).to have_http_status(:ok)
    end
    it 'render the correct album' do
      get :show, params: { 
        id: @album.id,
        resource: "artists"
      }
      expected_album = JSON.parse(response.body)
      expect(expected_album.size).to eq(1)
    end
    it 'returns http status not found' do
      get :show, params: { 
        id: 'xxx',
        resource: "artists"
      }
      expect(response).to have_http_status(:not_found)
    end
  end

  # Show songs for album
  describe 'GET show songs for album' do
    it 'returns http status ok' do
      get :show, params: { 
        id: @album.id,
        resource: "songs"
      }
      expect(response).to have_http_status(:ok)
    end
    it 'render the correct album' do
      get :show, params: { 
        id: @album.id,
        resource: "songs"
      }
      expected_album = JSON.parse(response.body)
      expect(expected_album.size).to eq(1)
    end
    it 'returns http status not found' do
      get :show, params: { 
        id: 'xxx',
        resource: "songs"
      }
      expect(response).to have_http_status(:not_found)
    end
  end

  # Search album
  describe 'GET search album' do
    it 'returns http status ok' do
      get :search, params: { 
        search: @album.title
      }
      expect(response).to have_http_status(:ok)
    end
    it 'render the correct search' do
      get :search, params: { 
        search: @album.title
      }
      expected_album = JSON.parse(response.body)
      expect(expected_album.size).to eq(1)
    end
  end

end