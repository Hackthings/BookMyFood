require 'rails_helper'

RSpec.describe Order, type: :model do
  let(:order) { FactoryGirl.create(:order) }

  it "has a valid factory" do
    expect(order).to be_valid
  end

  describe "Associations" do
    # it { should belong_to(:bidder) }
    # it { should belong_to(:auction) }
  end

  describe "Validations" do
    # it { should validate_presence_of(:bidder) }
  end
end
