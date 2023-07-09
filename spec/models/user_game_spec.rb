require 'rails_helper'

RSpec.describe UserGame, type: :model do
  describe 'instantiation and relationships' do
    it { should belong_to(:user) }
    it { should validate_presence_of(:game) }
  end
end