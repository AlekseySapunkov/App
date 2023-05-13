require "rails_helper"

RSpec.describe CampingsController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/campings").to route_to("campings#index")
    end

    it "routes to #new" do
      expect(get: "/campings/new").to route_to("campings#new")
    end

    it "routes to #show" do
      expect(get: "/campings/1").to route_to("campings#show", id: "1")
    end

    it "routes to #edit" do
      expect(get: "/campings/1/edit").to route_to("campings#edit", id: "1")
    end


    it "routes to #create" do
      expect(post: "/campings").to route_to("campings#create")
    end

    it "routes to #update via PUT" do
      expect(put: "/campings/1").to route_to("campings#update", id: "1")
    end

    it "routes to #update via PATCH" do
      expect(patch: "/campings/1").to route_to("campings#update", id: "1")
    end

    it "routes to #destroy" do
      expect(delete: "/campings/1").to route_to("campings#destroy", id: "1")
    end
  end
end
