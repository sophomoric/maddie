require "rails_helper"

describe Photo do
  it { should belong_to :domain }
end
