require 'rails_helper'

describe Page do
  it { should validate_presence_of(:title) }
  it { should validate_presence_of(:body) }
  it { should validate_presence_of(:order) }
  it { should validate_uniqueness_of(:order) }
  it { should validate_presence_of(:url_key) }
  # it { should validate_uniqueness_of(:url_key) }
  it { should belong_to :user }
end
