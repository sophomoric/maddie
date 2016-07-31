require 'rails_helper'

describe PageOrderer do
  describe "#visible_pages" do
    it "returns a list of ordered pages" do
      user = build(:user)
      domain = create(:domain, user: user, host: "test.host")
      create(:page, title: "page 3", order: 3, domain: domain)
      create(:page, title: "page 1", order: 1, domain: domain)
      create(:page, title: "page 2", order: 2, domain: domain)

      page_orderer = PageOrderer.new(domain.pages)
      page_titles = page_orderer.visible_pages.pluck(:title)

      expect(page_titles).to eq(["page 1", "page 2", "page 3"])
    end
  end

  describe "#new_page" do
    context "first page a domain creates" do
      it "returns a page with order set to 1" do
        user = create(:user)
        domain = create(:domain, user: user, host: "test.host")
        page_orderer = PageOrderer.new(domain.pages)

        expect(page_orderer.new_page.order).to eq(1)
      end
    end

    context "domain has 3 pages" do
      it "returns a page with the next number in sequence" do
        user = create(:user)
        domain = create(:domain, user: user, host: "test.host")
        domain.pages = []
        2.times { create(:page, domain: domain) }
        last_page = create(:page, domain: domain)
        page_orderer = PageOrderer.new(domain.reload.pages)

        expect(page_orderer.new_page.order).to eq(last_page.order + 1)
      end
    end
  end

  describe "page_after" do
    it "returns the next page in order sequence or loops to beginning" do
      user = create(:user)
      domain = create(:domain, user: user, host: "test.host")
      create(:domain, user: user, host: "test")
      first_page = create(:page, domain: domain)
      second_page = create(:page, domain: domain)
      third_page = create(:page, domain: domain)

      page_orderer = PageOrderer.new(domain.reload.pages)

      expect(page_orderer.page_after(second_page)).to eq(third_page)
      expect(page_orderer.page_after(third_page)).to eq(first_page)
    end

    it "ignores hidden pages" do
      user = create(:user)
      domain = create(:domain, user: user, host: "test")
      first_page = create(:page, domain: domain)
      _second_page_hidden = create(:page, domain: domain, hidden: true)
      third_page = create(:page, domain: domain)

      page_orderer = PageOrderer.new(domain.reload.pages)

      expect(page_orderer.page_after(first_page)).to eq(third_page)
    end
  end
end
