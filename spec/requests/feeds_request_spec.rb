require 'rails_helper'

RSpec.describe "Feeds", type: :request do

  let(:valid_attributes) {
    {
      :title => "Ruby News",
      :link => "https://www.ruby-lang.org/en/feeds/news.rss",
      :description => "The latest news from ruby-lang.org."
    }
  }

  describe 'GET feeds#index' do
    it 'returns a success response' do
      get '/'
      expect(response).to be_successful
    end
  end

  describe 'GET feeds#show' do
    let!(:feed) { Feed.create(valid_attributes) }
    it 'returns a success response' do
      get '/feeds', params: { id: feed }
      expect(response).to be_successful
    end
  end

  describe 'GET feeds#new' do
    it 'returns a success response' do
      get '/feeds/new'
      expect(response).to be_successful
    end
  end

  # describe 'GET feeds#edit' do
  #   let!(:feed) { Feed.create(valid_attributes) }
  #   it 'returns a success response' do
  #     get '/feeds/{}/edit', params: { id: feed }
  #     expect(response).to be_successful
  #   end
  # end

  describe 'POST feeds#create' do
    it 'create feed with valid attributes' do
      post "/feeds", :params => { :feed => {:title => "Test Title", link: "Test Link", description: "Test Description"} }
      expect(response).to have_http_status(302)
      # for 4.0 fake examples I'm sad from rspec 
      # https://relishapp.com/rspec/rspec-rails/docs/matchers/redirect-to-matcher
      # https://relishapp.com/rspec/rspec-rails/docs/request-specs/request-spec
    end
  end

  # describe 'PUT feeds#update' do
  #   let!(:feed) { Feed.create(valid_attributes) }
  #   it 'update feed with valid attributes' do
  #     before { put :update, id: feed, feed: feed }
  #     put "/feeds/#{assigns(:feed).id}", , :params => { :feed => { :title => "Test Title", link: "Test Link", description: "Test Description"} }
  #     expect(response).to have_http_status(302)
  #     # for 4.0 fake examples I'm sad from rspec 
  #     # https://relishapp.com/rspec/rspec-rails/docs/matchers/redirect-to-matcher
  #     # https://relishapp.com/rspec/rspec-rails/docs/request-specs/request-spec
  #   end
  # end

end
