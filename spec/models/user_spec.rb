# frozen_string_literal: true

require 'rails_helper'

RSpec.describe User, type: :model, vcr: { record: :new_episodes } do
  before(:each) do
    @host_1 = create(:user, city: "austin", state: "texas")
    @host_2 = create(:user, city: "san diego", state: "california")

    @event_1 = create(:event, host_id: @host_1.id, address: "304 W 34th St", city: "new york", state: "new york", zip: "10001")
    @event_2 = create(:event, host_id: @host_1.id, address: "100 E Camelback Rd", city: "phoenix", state: "arizona", zip: "85012")
    @event_3 = create(:event, host_id: @host_2.id, address: "488 S High St", city: "columbus", state: "ohio", zip: "43215")

    UserEvent.create(user_id: @host_1.id, event_id: @event_1.id)
    UserEvent.create(user_id: @host_1.id, event_id: @event_2.id)
    UserEvent.create(user_id: @host_2.id, event_id: @event_3.id)
  end

  describe 'instantiation and relationships' do
    it { should have_many(:user_events) }
    it { should have_many(:events).through(:user_events) }
    it { should have_many(:user_games) }
    it { should have_many(:games).through(:user_games) }

    it 'validates presense of username' do
      user = User.new(username: "", city: "austin", state: "texas", password: "password")
      expect(user.valid?).to eq(false)
    end

    it 'validates presense of password' do
      user = User.new(username: "name", city: "austin", state: "texas", password: "")
      expect(user.valid?).to eq(false)
    end

    it 'validates presense of city' do
      user = User.new(username: "name", city: "", state: "texas", password: "password")
      expect(user.valid?).to eq(false)
    end

    it 'validates presense of state' do
      user = User.new(username: "name", city: "austin", state: "", password: "password")
      expect(user.valid?).to eq(false)
    end
    # it { should validate_presence_of(:username) }
    # it { should validate_presence_of(:password) }
    # it { should validate_presence_of(:city) }
    # it { should validate_presence_of(:state) }
  end

  describe 'instance methods' do
    describe '#hosted_events' do
      it 'returns all events hosted by the user' do
        expect(@host_1.hosted_events).to eq([@event_1, @event_2])
        expect(@host_2.hosted_events).to eq([@event_3])
      end
    end

    describe '#sort_events_by_distance' do
      it 'sorts events by distance from user' do
        Event.destroy_all
        user = create(:user, city: "Boulder", state: "Colorado")
        event_1 = create(:event, title: "chipotle", address: "1100 Ken Pratt Blvd", city: "Longmont", state: "Colorado", zip: "80501")
        event_2 = create(:event, title: "chipotle", address: "375 McCaslin Blvd D", city: "Louisville", state: "Colorado", zip: "80027")
        event_3 = create(:event, title: "chipotle", address: "1650 28th St", city: "Boulder", state: "Colorado", zip: "80301")
        event_4 = create(:event, title: "chipotle", address: "1940 Coalton Rd", city: "Superior", state: "Colorado", zip: "80027")
        event_5 = create(:event, title: "chipotle", address: "548 W South Boulder Rd", city: "Lafayette", state: "Colorado", zip: "80026")

        expect(user.sort_events_by_distance.map { |event| Event.find(event["id"]) })
          .to eq([event_3, event_2, event_4, event_5, event_1])
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

  describe 'game names' do
    it 'collects user game names' do
      user = create(:user, city: "Denver", state: "Colorado")
      game_1 = create(:game, name: "Catan")
      game_2 = create(:game, name: "Stone Age")
      game_3 = create(:game, name: "Irish Gauge")
      game_4 = create(:game, name: "Elder Sign")
      game_5 = create(:game, name: "Ca$h 'n Gun$")

      game_6 = create(:game, name: "Ticket to Ride")
      game_7 = create(:game, name: "Pandemic")
      game_8 = create(:game, name: "7 Wonders")

      UserGame.create(user_id: user.id, game_id: game_1.id)
      UserGame.create(user_id: user.id, game_id: game_2.id)
      UserGame.create(user_id: user.id, game_id: game_3.id)
      UserGame.create(user_id: user.id, game_id: game_4.id)
      UserGame.create(user_id: user.id, game_id: game_5.id)

      expect(user.recommended_games.map(&:name).sort).to eq([game_6, game_7, game_8].map(&:name).sort)
    end
  end
end
