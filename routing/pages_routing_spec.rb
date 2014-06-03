require "spec_helper"

describe PagesController do
  describe "routing" do

    it "NO routes to #index" do
      get("/pages").should_not route_to("pages#index")
    end

    it 'routes to #show using slug' do
      get('/super-page').should route_to('pages#show', id: 'super-page')
    end

    it "routes to #new" do
      get("/pages/new").should route_to("pages#new")
    end

    it "routes to #show" do
      get("/pages/1").should route_to("pages#show", :id => "1")
    end

    it "routes to #edit" do
      get("/pages/1/edit").should route_to("pages#edit", :id => "1")
    end

    it "routes to #create" do
      post("/pages").should route_to("pages#create")
    end

    it "routes to #update" do
      put("/pages/1").should route_to("pages#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/pages/1").should route_to("pages#destroy", :id => "1")
    end

    it "provides a catch-all route (i.e. /about routes to page with the slug 'about')" do
      get("/about").should route_to("pages#show", id: 'about')
    end

  end
end
