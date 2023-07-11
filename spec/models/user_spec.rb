# frozen_string_literal: true

require 'rails_helper'

RSpec.describe User, type: :model do
  before(:each) do
    @host_1 = create(:user)
    @host_2 = create(:user)

    @event_1 = create(:event, host_id: @host_1.id)
    @event_2 = create(:event, host_id: @host_1.id)
    @event_3 = create(:event, host_id: @host_2.id)

    UserEvent.create(user_id: @host_1.id, event_id: @event_1.id)
    UserEvent.create(user_id: @host_1.id, event_id: @event_2.id)
    UserEvent.create(user_id: @host_2.id, event_id: @event_3.id)
  end

  describe 'instantiation and relationships' do
    it { should have_many(:user_events) }
    it { should have_many(:events).through(:user_events) }
    it { should have_many(:user_games) }
    it { should have_many(:games).through(:user_games) }
    it { should validate_presence_of(:username) }
    it { should validate_presence_of(:password) }
    it { should validate_presence_of(:city) }
    it { should validate_presence_of(:state) }
  end

  describe 'instance methods' do
    describe '#hosted_events' do
      it 'returns all events hosted by the user' do
        expect(@host_1.hosted_events).to eq([@event_1, @event_2])
        expect(@host_2.hosted_events).to eq([@event_3])
      end
    end

    describe '#resident_city' do
      it 'returns string with residents city and state' do
        user_1 = create(:user, city: "Seattle", state: "Washington")
        expect(user_1.resident_city).to eq("Seattle, Washington")
      end
    end
  end

  describe 'geocoder' do
    it "geocodes" do
      user_1 = create(:user, city: "Boulder", state: "Colorado")
      user_1.reload
      expect(user_1.lat).to eq(40.0149856)
      expect(user_1.lon).to eq(-105.270545)
    end
  end
end
