class ItemsController < ApplicationController
  before_action :set_feed, only: :index

  def index
    @items = @feed.items.order('date desc')
  end

  def show
    @item = Item.find(params[:id])
  end

  private

  def set_feed
    @feed = Feed.find(params[:id])
  end
end
