require "rails_helper"

RSpec.describe MetaPropertyList, type: :model do
  it { should belong_to :domain }
end
