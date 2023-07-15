# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.FactoryBot.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
User.destroy_all
Game.destroy_all
Event.destroy_all

GameFactory.new.build_games(GameService.new.all_games)

@user_1 = FactoryBot.create(:user, password: 'password', city: "montpelier", state: "vermont")
@user_2 = FactoryBot.create(:user, password: 'password', city: "austin", state: "texas")
@user_3 = FactoryBot.create(:user, password: 'password', city: "san diego", state: "california")
@user_4 = FactoryBot.create(:user, password: 'password', city: "harlem", state: "georgia")
@user_5 = FactoryBot.create(:user, password: 'password', city: 'denver', state: 'colorado')
@user_6 = FactoryBot.create(:user, password: 'password', city: 'colorado springs', state: 'colorado')
@user_7 = FactoryBot.create(:user, password: 'password', city: 'Boulder', state: 'Colorado')
@user_8 = FactoryBot.create(:user, password: 'password', city: 'Birmingham', state: 'Alabama')
@user_9 = FactoryBot.create(:user, password: 'password', city: 'Medford', state: 'Oregon')
@user_10 = FactoryBot.create(:user, password: 'password', city: 'Wailuku', state: 'Hawaii')
@user_11 = FactoryBot.create(:user, password: 'password', city: 'Columbus', state: 'Ohio')

@game_1 = Game.offset(rand(1099)).limit(1).first
@game_2 = Game.offset(rand(1099)).limit(1).first
@game_3 = Game.offset(rand(1099)).limit(1).first
@game_4 = Game.offset(rand(1099)).limit(1).first
@game_5 = Game.offset(rand(1099)).limit(1).first
@game_6 = Game.offset(rand(1099)).limit(1).first
@game_7 = Game.offset(rand(1099)).limit(1).first
@game_8 = Game.offset(rand(1099)).limit(1).first
@game_9 = Game.offset(rand(1099)).limit(1).first
@game_10 = Game.offset(rand(1099)).limit(1).first
@game_11 = Game.offset(rand(1099)).limit(1).first
@game_12 = Game.offset(rand(1099)).limit(1).first
@game_13 = Game.offset(rand(1099)).limit(1).first
@game_14 = Game.offset(rand(1099)).limit(1).first
@game_15 = Game.offset(rand(1099)).limit(1).first
@game_16 = Game.offset(rand(1099)).limit(1).first
@game_17 = Game.offset(rand(1099)).limit(1).first
@game_18 = Game.offset(rand(1099)).limit(1).first
@game_19 = Game.offset(rand(1099)).limit(1).first
@game_20 = Game.offset(rand(1099)).limit(1).first
@game_21 = Game.offset(rand(1099)).limit(1).first
@game_22 = Game.offset(rand(1099)).limit(1).first
@game_23 = Game.offset(rand(1099)).limit(1).first
@game_24 = Game.offset(rand(1099)).limit(1).first
@game_25 = Game.offset(rand(1099)).limit(1).first

@event_1 = FactoryBot.create(:event, address: "10515 N Mopac Expy", city: "Austin", state: "Texas", zip: "78759", title: 'Chipotle', cancelled: false,
                                     host_id: @user_1.id, game: Game.first.id, game_type: 'board game', date: "2023/10/01", start_time: "12:00", end_time: "14:00")
@event_2 = FactoryBot.create(:event, address: "100 E Camelback Rd", city: "phoenix", state: "arizona", zip: "85012", title: 'Chipotle', cancelled: false,
                                     host_id: @user_2.id, game: Game.second.id, game_type: 'board game', date: "2023/10/28", start_time: "18:00", end_time: "23:00")
@event_3 = FactoryBot.create(:event, address: "2700 W Anderson Ln", city: "Austin", state: "Texas", zip: "78757", title: 'Chipotle', cancelled: false,
                                     host_id: @user_3.id, game: Game.second.id, game_type: 'board game', date: "2023/10/15", start_time: "21:00", end_time: "22:00")
@event_4 = FactoryBot.create(:event, address: "2027 S Shepherd Dr", city: "Houston", state: "Texas", zip: "77019", title: 'Chipotle', cancelled: false,
                                     host_id: @user_4.id, game: Game.second.id, game_type: 'board game', date: "2023/10/16", start_time: "12:00", end_time: "15:00")
@event_5 = FactoryBot.create(:event, address: "580 Shelburne Rd ", city: "Burlington", state: "Vermont", zip: "05401", title: 'Chipotle', cancelled: false,
                                     host_id: @user_5.id, game: Game.second.id, game_type: 'board game', date: "2023/10/15", start_time: "12:00", end_time: "19:00")
@event_6 = FactoryBot.create(:event, address: "37 N Main St", city: "Rutland", state: "Vermont", zip: "05701", title: 'Chipotle', cancelled: false,
                                     host_id: @user_6.id, game: Game.second.id, game_type: 'board game', date: "2023/10/04", start_time: "17:00", end_time: "21:00")
@event_7 = FactoryBot.create(:event, address: "205 Dorset St", city: "South Burlington", state: "Vermont", zip: "05403", title: 'Chipotle', cancelled: false,
                                     host_id: @user_1.id, game: Game.second.id, game_type: 'board game', date: "2023/10/21", start_time: "08:00", end_time: "12:00")
@event_8 = FactoryBot.create(:event, address: "2320 S Lamar Blvd", city: "Austin", state: "Texas", zip: "78704", title: 'Chipotle', cancelled: false,
                                     host_id: @user_2.id, game: Game.second.id, game_type: 'board game', date: "2023/10/08", start_time: "09:00", end_time: "17:00")

@user_event_1 = UserEvent.create!(user_id: @user_1.id, event_id: @event_1.id)
@user_event_2 = UserEvent.create!(user_id: @user_2.id, event_id: @event_1.id)
@user_event_3 = UserEvent.create!(user_id: @user_3.id, event_id: @event_1.id)
@user_event_4 = UserEvent.create!(user_id: @user_2.id, event_id: @event_2.id)
@user_event_5 = UserEvent.create!(user_id: @user_4.id, event_id: @event_2.id)
@user_event_6 = UserEvent.create!(user_id: @user_5.id, event_id: @event_2.id)
@user_event_7 = UserEvent.create!(user_id: @user_6.id, event_id: @event_3.id)
@user_event_8 = UserEvent.create!(user_id: @user_7.id, event_id: @event_4.id)
@user_event_9 = UserEvent.create!(user_id: @user_8.id, event_id: @event_4.id)
@user_event_10 = UserEvent.create!(user_id: @user_9.id, event_id: @event_4.id)
@user_event_11 = UserEvent.create!(user_id: @user_10.id, event_id: @event_4.id)
@user_event_12 = UserEvent.create!(user_id: @user_11.id, event_id: @event_5.id)
@user_event_13 = UserEvent.create!(user_id: @user_8.id, event_id: @event_5.id)
@user_event_14 = UserEvent.create!(user_id: @user_1.id, event_id: @event_6.id)
@user_event_15 = UserEvent.create!(user_id: @user_7.id, event_id: @event_6.id)
@user_event_16 = UserEvent.create!(user_id: @user_2.id, event_id: @event_6.id)
@user_event_17 = UserEvent.create!(user_id: @user_3.id, event_id: @event_6.id)
@user_event_18 = UserEvent.create!(user_id: @user_11.id, event_id: @event_7.id)
@user_event_19 = UserEvent.create!(user_id: @user_6.id, event_id: @event_7.id)
@user_event_20 = UserEvent.create!(user_id: @user_4.id, event_id: @event_7.id)
@user_event_21 = UserEvent.create!(user_id: @user_10.id, event_id: @event_8.id)
@user_event_22 = UserEvent.create!(user_id: @user_5.id, event_id: @event_8.id)

@user_game_1 = UserGame.create!(user_id: @user_1.id, game: @game_1)
@user_game_2 = UserGame.create!(user_id: @user_1.id, game: @game_2)
@user_game_3 = UserGame.create!(user_id: @user_1.id, game: @game_3)
@user_game_4 = UserGame.create!(user_id: @user_1.id, game: @game_4)
@user_game_5 = UserGame.create!(user_id: @user_1.id, game: @game_5)
@user_game_6 = UserGame.create!(user_id: @user_1.id, game: @game_6)
@user_game_7 = UserGame.create!(user_id: @user_1.id, game: @game_7)
@user_game_8 = UserGame.create!(user_id: @user_1.id, game: @game_8)
@user_game_9 = UserGame.create!(user_id: @user_1.id, game: @game_9)
@user_game_10 = UserGame.create!(user_id: @user_1.id, game: @game_10)
@user_game_11 = UserGame.create!(user_id: @user_1.id, game: @game_11)
@user_game_12 = UserGame.create!(user_id: @user_1.id, game: @game_12)
@user_game_13 = UserGame.create!(user_id: @user_2.id, game: @game_13)
@user_game_14 = UserGame.create!(user_id: @user_2.id, game: @game_14)
@user_game_15 = UserGame.create!(user_id: @user_2.id, game: @game_15)
@user_game_16 = UserGame.create!(user_id: @user_2.id, game: @game_16)
@user_game_17 = UserGame.create!(user_id: @user_2.id, game: @game_17)
@user_game_18 = UserGame.create!(user_id: @user_2.id, game: @game_18)
@user_game_19 = UserGame.create!(user_id: @user_2.id, game: @game_19)
@user_game_20 = UserGame.create!(user_id: @user_2.id, game: @game_20)
@user_game_21 = UserGame.create!(user_id: @user_2.id, game: @game_21)
@user_game_22 = UserGame.create!(user_id: @user_2.id, game: @game_22)
@user_game_23 = UserGame.create!(user_id: @user_2.id, game: @game_23)
@user_game_24 = UserGame.create!(user_id: @user_2.id, game: @game_24)
@user_game_25 = UserGame.create!(user_id: @user_2.id, game: @game_25)

Game.create(bga_id: "12k3jbhgk235kjh", name: "Candy Land", min_players: 2, max_players: 4, min_playtime: 15, max_playtime: 21,
            description: "<p><em>Candy Land</em> Candy Land (also Candyland) is a simple racing board game published by Hasbro. The game requires no reading and minimal counting skills,
            making it suitable for young children. No strategy is involved as players are never required to make choices; only following directions is required. About one million copies
            per year are sold</p>",
            image_url: 'https://upload.wikimedia.org/wikipedia/en/thumb/d/de/Classic_Candy_Land_by_Winning_Moves.jpg/220px-Classic_Candy_Land_by_Winning_Moves.jpg', average_user_rating: 5,
            average_strategy_complexity: 5)
