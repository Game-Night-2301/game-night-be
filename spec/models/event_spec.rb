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
  end
end
