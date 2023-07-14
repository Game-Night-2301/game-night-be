require 'rails_helper'

RSpec.describe AiService, vcr: { record: :new_episodes } do
  it 'can create a connection and consume the API' do
    collection = ["Catan", "Betrayal at House on the Hill", "Gloom Haven", "Brass: Birmingham", "Survive: Escape from Atlantis"]
    ai_service = AiService.new.get_games(collection)

    expect(ai_service).to be_a(Array)
    expect(ai_service).to all(be_a(String))
    expect(ai_service.length).to eq(3)
  end
end
