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

    it "returns an empty array if no user is present" do
      page_orderer = PageOrderer.new(nil)

      expect(page_orderer.pages).to eq([])
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
        user = create(:user)
        create(:domain, user: user, host: "test")
        user.pages = []
        2.times { create(:page, user: user) }
        last_page = create(:page, user: user)
        page_orderer = PageOrderer.new(user.reload)

        expect(page_orderer.next_page.order).to eq(last_page.order + 1)
      end
    end
  end

  describe "page_after" do
    it "returns the next page in order sequence or loops to beginning" do
      user = create(:user)
      create(:domain, user: user, host: "test")
      first_page = create(:page, user: user)
      second_page = create(:page, user: user)
      third_page = create(:page, user: user)

      page_orderer = PageOrderer.new(user.reload)

      expect(page_orderer.page_after(second_page)).to eq(third_page)
      expect(page_orderer.page_after(third_page)).to eq(first_page)
    end

    it "ignores hidden pages" do
      user = create(:user)
      create(:domain, user: user, host: "test")
      first_page = create(:page, user: user)
      _second_page_hidden = create(:page, user: user, hidden: true)
      third_page = create(:page, user: user)

      page_orderer = PageOrderer.new(user.reload)

      expect(page_orderer.page_after(first_page)).to eq(third_page)
    end
  end
end
