require 'rails_helper'

describe PageOrderer do
  describe "#pages" do
    it "returns a list of ordered pages" do
      user = build(:user)
      create(:page, title: "page 3", order: 3,  user: user)
      create(:page, title: "page 1", order: 1, user: user)
      create(:page, title: "page 2", order: 2, user: user)

      page_orderer = PageOrderer.new(user)
      page_titles = page_orderer.pages.pluck(:title)

      expect(page_titles).to eq(["page 1", "page 2", "page 3"])
    end
  end

  describe "#next_page" do
    context "first page a user creates" do
      it "returns a page with order set to 1" do
        user = create(:user)
        page_orderer = PageOrderer.new(user)

        expect(page_orderer.next_page.order).to eq(1)
      end
    end

    context "user has 3 pages" do
      it "returns a page with the next number in sequence" do
        user = create(:user, domain: "test")
        user.pages = []
        3.times { create(:page, user: user) }
        page_orderer = PageOrderer.new(user.reload)

        expect(page_orderer.next_page.order).to eq(4)
      end
    end
  end
end
