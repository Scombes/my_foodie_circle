require 'spec_helper'

describe Restaurant do
  let(:user) { FactoryGirl.create(:user) }
  before { @restaurant = user.restaurants.build(name: "Test", address: "1234 test", city: "Testville", state: "TX", postal: "Test", phone: "2145551234", category: "Asian") }
  

  subject { @restaurant }
  it { should respond_to(:name) }
  it { should respond_to(:city) }
  it { should respond_to(:user_id)}
  it { should respond_to(:user) }
  its(:user) { should eq user }

  it { should be_valid }

  describe "when no user id" do
  	before { @restaurant.user_id = nil }
  	it { should_not be_valid }
  end
end
