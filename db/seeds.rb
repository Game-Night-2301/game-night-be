# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
GameFactory.new.build_games(GameService.new.all_games)

@user_1 = create(:user, password: 'password', city: "montpelier", state: "vermont")
@user_2 = create(:user password: 'password', city: "austin", state: "texas")
@user_3 = create(:user, password: 'password', city: "san diego", state: "california")
@user_4 = create(:user, password: 'password', city: "harlem", state: "georgia")
@user_5 = create(:user, password: 'password', city: 'denver', state: 'colorado')
@user_6 = create(:user, password: 'password', city: 'colorado springs', state: 'colorado')
@user_7 = create(:user, password: 'password', city: 'Boulder', state: 'Colorado')
@user_8 = create(:user, password: 'password', city: 'Birmingham', state: 'Alabama')
@user_9 = create(:user, password: 'password', city: 'Medford', state: 'Oregon')
@user_10 = create(:user, password: 'password', city: 'Wailuku', state: 'Hawaii')
@user_11 = create(:user, password: 'password', city: 'Columbus', state: 'Ohio')


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

@event_1 = Event.create!(date: '2023/01/01', address: "10515 N Mopac Expy", city: "Austin", state: "Texas", zip: "78759", title: 'Chipotle', cancelled: false, description: 'Come play with us at the chipotle on Mopac!',
                         host_id: @user_1.id, game: Game.first.id, game_type: 'board game', date: "2021/01/01", start_time: "12:00", end_time: "14:00")
@event_2 = Event.create!(date: '2023/02/02', address: "100 E Camelback Rd", city: "phoenix", state: "arizona", zip: "85012", title: 'Chipotle', cancelled: false, description: "We're serious gamers so bring your A game",
                         host_id: @user_2.id, game: Game.second.id, game_type: 'board game', date: "2021/01/01", start_time: "12:00", end_time: "14:00")
@event_3 = Event.create!(date: '2023/02/02', address: "2700 W Anderson Ln", city: "Austin", state: "Texas", zip: "78757", title: 'Chipotle', cancelled: false, description: 'This is just a friendly game night',
                         host_id: @user_3.id, game: Game.second.id, game_type: 'board game', date: "2021/01/01", start_time: "12:00", end_time: "14:00")
@event_4 = Event.create!(date: '2023/02/02', address: "2027 S Shepherd Dr", city: "Houston", state: "Texas", zip: "77019", title: 'Chipotle', cancelled: false, description: "Bring Snacks, we're going to be gaming all night!",
                         host_id: @user_4.id, game: Game.second.id, game_type: 'board game', date: "2021/01/01", start_time: "12:00", end_time: "14:00")
@event_5 = Event.create!(date: '2023/02/02', address: "580 Shelburne Rd ", city: "Burlington", state: "Vermont", zip: "05401", title: 'Chipotle', cancelled: false, description: "This isn't your grandma's game night.",
                         host_id: @user_5.id, game: Game.second.id, game_type: 'board game', date: "2021/01/01", start_time: "12:00", end_time: "14:00")
@event_6 = Event.create!(date: '2023/02/02', address: "37 N Main St", city: "Rutland", state: "Vermont", zip: "05701", title: 'Chipotle', cancelled: false, description: "Don't tell the police about this game, we're going to be having an illegal amount of fun.",
                         host_id: @user_6.id, game: Game.second.id, game_type: 'board game', date: "2021/01/01", start_time: "12:00", end_time: "14:00")
@event_7 = Event.create!(date: '2023/02/02', address: "205 Dorset St", city: "South Burlington", state: "Vermont", zip: "05403", title: 'Chipotle', cancelled: false, description: "I came here to play games and chew gum, and I'm all out of gum.",
                         host_id: @user_1.id, game: Game.second.id, game_type: 'board game', date: "2021/01/01", start_time: "12:00", end_time: "14:00")
@event_8 = Event.create!(date: '2023/02/02', address: "2320 S Lamar Blvd", city: "Austin", state: "Texas", zip: "78704", title: 'Chipotle', cancelled: false, description: "DnD got cancelled so let's play a board game instead!",
                         host_id: @user_2.id, game: Game.second.id, game_type: 'board game', date: "2021/01/01", start_time: "12:00", end_time: "14:00")

@user_event_1 = UserEvent.create!(user_id: @user_1.id, event_id: @event_1.id)
@user_event_2 = UserEvent.create!(user_id: @user_2.id, event_id: @event_1.id)
@user_event_3 = UserEvent.create!(user_id: @user_3.id, event_id: @event_1.id)
@user_event_4 = UserEvent.create!(user_id: @user_2.id, event_id: @event_2.id)
@user_event_5 = UserEvent.create!(user_id: @user_4.id, event_id: @event_2.id)
@user_event_6 = UserEvent.create!(user_id: @user_5.id, event_id: @event_2.id)
@user_event_6 = UserEvent.create!(user_id: @user_1.id, event_id: @event_2.id)


@user_game_1 = UserGame.create!(user_id: @user_1.id, game: Game.offset(rand(1099)).limit(1).first)
@user_game_2 = UserGame.create!(user_id: @user_1.id, game: Game.offset(rand(1099)).limit(1).first)
@user_game_3 = UserGame.create!(user_id: @user_1.id, game: Game.offset(rand(1099)).limit(1).first)
@user_game_4 = UserGame.create!(user_id: @user_1.id, game: Game.offset(rand(1099)).limit(1).first)
@user_game_5 = UserGame.create!(user_id: @user_1.id, game: Game.offset(rand(1099)).limit(1).first)
@user_game_5 = UserGame.create!(user_id: @user_1.id, game: Game.offset(rand(1099)).limit(1).first)
@user_game_5 = UserGame.create!(user_id: @user_1.id, game: Game.offset(rand(1099)).limit(1).first)
@user_game_5 = UserGame.create!(user_id: @user_1.id, game: Game.offset(rand(1099)).limit(1).first)
@user_game_5 = UserGame.create!(user_id: @user_1.id, game: Game.offset(rand(1099)).limit(1).first)
@user_game_5 = UserGame.create!(user_id: @user_1.id, game: Game.offset(rand(1099)).limit(1).first)
@user_game_5 = UserGame.create!(user_id: @user_1.id, game: Game.offset(rand(1099)).limit(1).first)
@user_game_5 = UserGame.create!(user_id: @user_1.id, game: Game.offset(rand(1099)).limit(1).first)
@user_game_6 = UserGame.create!(user_id: @user_2.id, game: Game.offset(rand(1099)).limit(1).first)
@user_game_6 = UserGame.create!(user_id: @user_2.id, game: Game.offset(rand(1099)).limit(1).first)
@user_game_6 = UserGame.create!(user_id: @user_2.id, game: Game.offset(rand(1099)).limit(1).first)
@user_game_6 = UserGame.create!(user_id: @user_2.id, game: Game.offset(rand(1099)).limit(1).first)
@user_game_6 = UserGame.create!(user_id: @user_2.id, game: Game.offset(rand(1099)).limit(1).first)
@user_game_6 = UserGame.create!(user_id: @user_2.id, game: Game.offset(rand(1099)).limit(1).first)
@user_game_6 = UserGame.create!(user_id: @user_2.id, game: Game.offset(rand(1099)).limit(1).first)
@user_game_6 = UserGame.create!(user_id: @user_2.id, game: Game.offset(rand(1099)).limit(1).first)
@user_game_7 = UserGame.create!(user_id: @user_2.id, game: Game.offset(rand(1099)).limit(1).first)
@user_game_8 = UserGame.create!(user_id: @user_2.id, game: Game.offset(rand(1099)).limit(1).first)
@user_game_9 = UserGame.create!(user_id: @user_2.id, game: Game.offset(rand(1099)).limit(1).first)
@user_game_10 = UserGame.create!(user_id: @user_2.id, game: Game.offset(rand(1099)).limit(1).first)
