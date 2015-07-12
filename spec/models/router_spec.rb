require "rails_helper"

describe Router do
  describe ".page_url" do
    it "generates route based on url_key" do
      page = build(:page)
      page.url_key = "about-me"

      expect(Router.new.page_url(page)).to match("about-me")
    end

    it "routes to the main page if no url_key" do
      page1 = build(:page)
      page1.url_key = ""
      page2 = build(:page)
      page2.url_key = nil

      expect(Router.new.page_url(page1)).to eq(root_url)
      expect(Router.new.page_url(page2)).to eq(root_url)
    end
  end
end
