require 'rails_helper'

RSpec.describe User, type: :model do 
  describe "instantiation and relationships" do
    it { should have_many(:user_events) }
    it { should have_many(:events).through(:user_events) }
    it { should validate_presence_of(:username) }
    it { should validate_presence_of(:password) }
    it { should validate_presence_of(:city) }
    it { should validate_presence_of(:state) }
  end
end