# frozen_string_literal: true

require 'rails_helper'

RSpec.describe UserEvent, type: :model, vcr: { record: :new_episodes } do
  describe 'instantiation and relationships' do
    it { should belong_to(:user) }
    it { should belong_to(:event) }

    before do
      @user = create(:user, city: "montpelier", state: "vermont")
      @event = create(:event, id: 2000, address: "304 W 34th St", city: "new york", state: "new york", zip: "10001")
      @user_event = UserEvent.create(user_id: @user.id, event_id: @event.id)
    end

    subject { @user_event }
    it { should validate_uniqueness_of(:user_id).scoped_to(:event_id) }
  end
end
