# frozen_string_literal: true

require 'rails_helper'

RSpec.describe UserEvent, type: :model do
  describe 'instantiation and relationships' do
    it { should belong_to(:user) }
    it { should belong_to(:event) }

    before do
      @user = create(:user)
      @event = create(:event, id: 2000)
      @user_event = UserEvent.create(user_id: @user.id, event_id: @event.id)
    end

    subject { @user_event }
    it { should validate_uniqueness_of(:user_id).scoped_to(:event_id) }
  end
end
