require 'rails_helper'

RSpec.describe Domain, :type => :model do
  it { should belong_to :user }
  it { should have_one :meta_property_list }
  it { should validate_uniqueness_of(:host) }
  it { should validate_presence_of(:host) }
end
