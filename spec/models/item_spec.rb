require 'rails_helper'

RSpec.describe Item, type: :model do

  describe 'validation test' do
      it 'ensures link presence' do
        feed = Feed.new(title: 'Test Title', description: 'Test Description').save
        expect(feed).to eq(false)
      end

      it 'ensures title presence' do
        feed = Feed.new(link: 'Test Link', description: 'Test Description').save
        expect(feed).to eq(false)
      end

      it 'ensures description presence' do
        feed = Feed.new(link: 'Test Link', title: 'Test Title').save
        expect(feed).to eq(false)
      end

      it 'ensures created' do
        feed = Feed.new(link: 'Test Link', title: 'Test Title', description: 'Test Description').save
        expect(feed).to eq(true)
      end
  end

end
