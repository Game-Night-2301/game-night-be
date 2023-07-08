require 'rails_helper'

RSpec.describe User, type: :model do 
  describe "instantiation and relationships" do
    it { should have_many(:user_events) }
    it { should have_many(:events).through(:user_events) }
  end
end