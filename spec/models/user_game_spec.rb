# frozen_string_literal: true

require 'rails_helper'

RSpec.describe UserGame, type: :model do
  describe 'instantiation and relationships' do
    it { should belong_to(:user) }
    it { should validate_presence_of(:game) }

    before do
      @user = create(:user)
      @game = create(:game, id: 2000)
      @user_game = UserGame.create(user_id: @user.id, game_id: @game.id)
    end

    subject { @user_game }
    it { should validate_uniqueness_of(:user_id).scoped_to(:game_id) }
  end
end
