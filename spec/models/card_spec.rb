require "rails_helper"

RSpec.describe Card, type: :model do
  describe "Associations" do
    it { is_expected.to belong_to(:list) }
    it { is_expected.to have_one(:board) }
  end
end
