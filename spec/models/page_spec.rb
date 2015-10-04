require 'rails_helper'

describe Page do
  it { should validate_presence_of(:title) }
  it { should validate_presence_of(:body) }
  it { should validate_presence_of(:order) }
  it { should validate_uniqueness_of(:order) }
  it { should validate_presence_of(:url_key) }
  it { should belong_to :user }

  describe "unique url_keys" do
    it "does not allow user to have a page with same url key" do
      user = create(:user)
      user_2 = create(:user)

      create(:page, url_key: "test", user: user)
      page = build(:page, url_key: "test", user: user)

      expect(page).to_not be_valid

      page.user = user_2
      expect(page).to be_valid
    end

    it "does not allow pages to have the same order" do
      user = create(:user)
      user_2 = create(:user)

      create(:page, user: user, order: 1)
      page = build(:page, user: user, order: 1)

      expect(page).to_not be_valid

      page.user = user_2
      expect(page).to be_valid
    end
  end
end
