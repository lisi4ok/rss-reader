require 'rails_helper'

# Change this FeedsController to your project
RSpec.describe FeedsController, type: :controller do

  describe "GET #index" do
    subject { get :index }
    it "renders the index template" do
      expect(subject).to render_template("feeds/index")
      expect(response.status).to eq(200)
    end
    it "does not render a different template" do
      expect(subject).to_not render_template("feeds/show")
    end
  end

  describe "GET #show" do
    subject { get :show }
    it "renders the show template" do
      expect(subject).to render_template("feeds/show")
      expect(response.status).to eq(200)
    end
    it "does not render a different template" do
      expect(subject).to_not render_template("feeds/index")
    end
  end

  describe "GET #new" do
    subject { get :show }
    it "renders the new template" do
      expect(subject).to render_template("feeds/new")
      expect(response.status).to eq(200)
    end
    it "does not render a different template" do
      expect(subject).to_not render_template("feeds/edit")
    end
  end

  describe "POST #create" do
    subject { post :create, :params => { :feed => { :title => "Ruby News", :link => "https://www.ruby-lang.org/en/feeds/news.rss", :description => "The latest news from ruby-lang.org." } } }

    it "redirects to feed_url(@feed)" do
      expect(subject).to redirect_to(feed_url(assigns(:feed)))
    end

    it "redirects_to :action => :show" do
      expect(subject).to redirect_to :action => :show,
                                     :id => assigns(:feed).id
    end

    it "redirects_to(@feed)" do
      expect(subject).to redirect_to(assigns(:feed))
    end

    it "redirects_to /feed/:id" do
      expect(subject).to redirect_to("/feed/#{assigns(:feed).id}")
    end
  end

  describe "PATCH #update" do
    subject { patch :update, :params => { :feed => { :title => "Ruby News", :link => "https://www.ruby-lang.org/en/feeds/news.rss", :description => "The latest news from ruby-lang.org." } } }

    it "redirects to feed_url(@feed)" do
      expect(subject).to redirect_to(feed_url(assigns(:feed)))
    end

    it "redirects_to :action => :show" do
      expect(subject).to redirect_to :action => :show,
                                     :id => assigns(:feed).id
    end

    it "redirects_to(@feed)" do
      expect(subject).to redirect_to(assigns(:feed))
    end

    it "redirects_to /feed/:id" do
      expect(subject).to redirect_to("/feed/#{assigns(:feed).id}")
    end
  end

  describe "PUT #update" do
    subject { put :update, :params => { :feed => { :title => "Ruby News", :link => "https://www.ruby-lang.org/en/feeds/news.rss", :description => "The latest news from ruby-lang.org." } } }

    it "redirects to feed_url(@feed)" do
      expect(subject).to redirect_to(feed_url(assigns(:feed)))
    end

    it "redirects_to :action => :show" do
      expect(subject).to redirect_to :action => :show,
                                     :id => assigns(:feed).id
    end

    it "redirects_to(@feed)" do
      expect(subject).to redirect_to(assigns(:feed))
    end

    it "redirects_to /feed/:id" do
      expect(subject).to redirect_to("/feed/#{assigns(:feed).id}")
    end
  end

  describe "DELETE #destroy" do
    delete :destroy, params { id: feed.id }
    it "redirects to feeds_url" do
      expect(subject).to redirect_to(feeds_url)
    end
  end

end