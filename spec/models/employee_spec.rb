require "rails_helper"

describe Employee do
  it { is_expected.to validate_presence_of(:name) }
  it { is_expected.to validate_presence_of(:department) }
end
