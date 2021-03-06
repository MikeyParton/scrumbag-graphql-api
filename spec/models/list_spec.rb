require "rails_helper"

RSpec.describe List, type: :model do
  describe "Associations" do
    it { is_expected.to belong_to(:board) }
    it { is_expected.to have_many(:cards) }
  end
end
