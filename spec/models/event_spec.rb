# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Event, type: :model, vcr: { record: :new_episodes } do
  before(:each) do
    @host = create(:user, city: "montpelier", state: "vermont")
    @user_1 = create(:user, city: "austin", state: "texas")
    @event = create(:event, host_id: @host.id, address: "304 W 34th St", city: "new york", state: "new york", zip: "10001")

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
  end

  describe 'geocoder' do
    it 'geocodes' do
      user = create(:user, city: "harlem", state: "georgia")
      event = create(:event, host_id: user.id, address: "9464 county road", city: "Calais", state: "Vermont", zip: "05648")
      expect(event.lat).to eq(44.3257532)
      expect(event.lon).to eq(-72.5273934)
    end
  end
end
