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

end
