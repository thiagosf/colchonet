require "spec_helper"

describe Admin::RoomsController do
  describe "routing" do

    it "routes to #index" do
      get("/admin/rooms").should route_to("admin/rooms#index")
    end

    it "routes to #new" do
      get("/admin/rooms/new").should route_to("admin/rooms#new")
    end

    it "routes to #show" do
      get("/admin/rooms/1").should route_to("admin/rooms#show", :id => "1")
    end

    it "routes to #edit" do
      get("/admin/rooms/1/edit").should route_to("admin/rooms#edit", :id => "1")
    end

    it "routes to #create" do
      post("/admin/rooms").should route_to("admin/rooms#create")
    end

    it "routes to #update" do
      put("/admin/rooms/1").should route_to("admin/rooms#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/admin/rooms/1").should route_to("admin/rooms#destroy", :id => "1")
    end

  end
end
