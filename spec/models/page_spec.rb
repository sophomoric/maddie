require 'rails_helper'

describe Page do
  it { should validate_presence_of(:title) }
  it { should validate_presence_of(:body) }
  it { should validate_presence_of(:order) }
  it { should validate_uniqueness_of(:order) }

  describe "#ordered_pages" do
    it "should return pages in order" do
      page_2 = create(:page, order: 2)
      page_0 = create(:page, order: 0)
      page_1 = create(:page, order: 1)

      expect(Page.ordered_pages).to eq([page_0, page_1, page_2])
    end
  end

  describe "#next_page" do
    it "has order set 1 higher than last page" do
      create(:page, order: 5)
      expect(Page.next_page.order).to eq(6)
    end

    it "has order 0 if no other pages exist" do
      expect(Page.next_page.order).to eq(0)
    end
  end
end
