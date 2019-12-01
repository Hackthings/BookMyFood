require 'rails_helper'

RSpec.describe Food, type: :model do
  let(:food) { FactoryGirl.create(:food) }

  it "has a valid factory" do
    expect(food).to be_valid
  end

  describe "Associations" do
    # it { should belong_to(:bidder) }
    # it { should belong_to(:auction) }
  end

  describe "Validations" do
    # it { should validate_presence_of(:bidder) }
  end
end
