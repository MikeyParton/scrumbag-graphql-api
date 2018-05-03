require "rails_helper"

RSpec.describe Board, type: :model do
  describe "Associations" do
    it { is_expected.to have_many(:lists) }
    it { is_expected.to have_many(:cards) }
  end
end
