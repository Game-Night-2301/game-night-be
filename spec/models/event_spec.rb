# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Event, type: :model do
  before(:each) do
    @host = create(:user)
    @user_1 = create(:user)
    @event = create(:event, host_id: @host.id)

    UserEvent.create(user_id: @host.id, event_id: @event.id)
    UserEvent.create(user_id: @user_1.id, event_id: @event.id)
  end

  describe 'instantiation and relationships' do
    it { should have_many(:user_events) }
    it { should have_many(:users).through(:user_events) }
    it { should validate_presence_of(:date) }
    it { should validate_presence_of(:address) }
    it { should validate_presence_of(:city) }
    it { should validate_presence_of(:state) }
    it { should validate_presence_of(:zip) }
    it { should validate_presence_of(:title) }
    it { should validate_presence_of(:description) }
    it { should validate_presence_of(:host_id) }
    it { should validate_presence_of(:game) }
    it { should validate_presence_of(:game_type) }
  end

  describe 'instance methods' do
    describe '#find_host' do
      it 'returns the host of the event' do
        expect(@event.find_host(@host.id)).to eq(@host)
      end
    end

    describe '#player_count' do
      it 'returns the number of players attending the event' do
        expect(@event.player_count).to eq(2)
      end
    end

    describe '#full_address' do
      it 'returns full address' do
        event = create(:event, host_id: @user_1.id, address: "9464 county road", city: "Calais", state: "Vermont", zip: "05648")
        expect(event.full_address).to eq("9464 county road Calais, Vermont 05648")
      end
    end

    describe '#sort_events_by_distance' do
      it 'sorts events by distance from user' do
        user = create(user, city: "Boulder", state: "Colorado")
        event_1 = create(:event, title: "chipotle", address: "1100 Ken Pratt Blvd B" city: "Longmont", state: "Colorado", zip: 80501)
        event_2 = create(:event, title: "chipotle", address: "375 McCaslin Blvd D" city: "Louisville", state: "Colorado", zip: 80027)
        event_3 = create(:event, title: "chipotle", address: "1650 28th St UNIT 1224" city: "Boulder", state: "Colorado", zip: 80301)
        event_4 = create(:event, title: "chipotle", address: "1940 Coalton Rd" city: "Superior", state: "Colorado", zip: 80027)
        event_5 = create(:event, title: "chipotle", address: "548 W South Boulder Rd d" city: "Lafayette", state: "Colorado", zip: 80026)
        expect(user.sort_events_by_distance).to eq([event_3, event_2, event_5, event_4, event_1])
      end
    end
  end

  describe 'geocoder' do
    it 'geocodes' do
      user = create(:user)
      event = create(:event, host_id: user.id, address: "9464 county road", city: "Calais", state: "Vermont", zip: "05648")
      expect(event.lat).to eq(44.325782)
      expect(event.lon).to eq(-72.52738)
    end
  end
end
