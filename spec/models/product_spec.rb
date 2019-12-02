require 'rails_helper'

RSpec.describe Product, type: :model do
  let(:product) { FactoryGirl.create(:product) }

  it "has a valid factory" do
    expect(product).to be_valid
  end

  describe "Associations" do
    # it { should belong_to(:bidder) }
    # it { should belong_to(:auction) }
  end

  describe "Validations" do
    # it { should validate_presence_of(:bidder) }
  end
end
