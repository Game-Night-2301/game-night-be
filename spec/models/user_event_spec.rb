require 'rails_helper'

RSpec.describe UserEvent, type: :model do
  describe 'instantiation and relationships' do
    it { should belong_to(:user) }
    it { should belong_to(:event) }
  end
end