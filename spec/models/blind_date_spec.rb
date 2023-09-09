require "rails_helper"

describe BlindDate do
  it { is_expected.to validate_presence_of(:week) }

  it { should have_and_belong_to_many(:employees) }
end
