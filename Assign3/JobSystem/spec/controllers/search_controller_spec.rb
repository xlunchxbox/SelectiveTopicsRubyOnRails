require 'spec_helper'

describe SearchController do

  describe "GET 'search_results'" do
    it "returns http success" do
      get 'search_results'
      response.should be_success
    end
  end

end
