require 'rails_helper'

describe Page do
  it { should validate_presence_of(:title) }
  it { should validate_presence_of(:body) }
  it { should validate_presence_of(:order) }
  it { should validate_uniqueness_of(:order) }
  it { should validate_presence_of(:url_key) }
  it { should belong_to :domain }

  describe "unique url_keys" do
    it "does not allow a domain to have a page with same url key" do
      domain = create(:domain)
      domain_2 = create(:domain)

      create(:page, url_key: "test", domain: domain)
      page = build(:page, url_key: "test", domain: domain)

      expect(page).to_not be_valid

      page.domain = domain_2
      expect(page).to be_valid
    end

    it "does not allow pages to have the same order" do
      domain = create(:domain)
      domain_2 = create(:domain)

      create(:page, domain: domain, order: 1)
      page = build(:page, domain: domain, order: 1)

      expect(page).to_not be_valid

      page.domain = domain_2
      expect(page).to be_valid
    end

    it "prevents reserved words" do
      reserved_word = Page::RESERVED_WORDS.first
      page = build(:page, url_key: reserved_word)

      expect(page).not_to be_valid
    end
  end
end
