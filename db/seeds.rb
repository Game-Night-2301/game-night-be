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

# GameFactory.new.build_games(GameService.new.all_games)
file = File.read('./db/games.json')
games = JSON.parse(file, symbolize_names: true)
games.each do |game|
  Game.create!(game)
end

@user_1 = User.create!(username: "RollTheRebellion", password: 'password', city: 'Denver', state: "Colorado")
@user_2 = User.create!(username: "DiceyDebauchery", password: 'password', city: 'Denver', state: "Colorado")
@user_3 = User.create!(username: "PawnSacrilege", password: 'password', city: 'Denver', state: "Colorado")
@user_4 = User.create!(username: "KnightsErrantLaughs", password: 'password', city: 'Denver', state: "Colorado")
@user_5 = User.create!(username: "TabletopTurbulence", password: 'password', city: 'Denver', state: "Colorado")
@user_6 = User.create!(username: "SaucyTileTriumph", password: 'password', city: 'Denver', state: "Colorado")
@user_7 = User.create!(username: "CatanControversy", password: 'password', city: 'Denver', state: "Colorado")
@user_8 = User.create!(username: "MeepleMayhem", password: 'password', city: 'Denver', state: "Colorado")
@user_9 = User.create!(username: "RollinRuckus", password: 'password', city: 'Denver', state: "Colorado")
@user_10 = User.create!(username: "BoardgameBedlam", password: 'password', city: 'Denver', state: "Colorado")
@user_11 = User.create!(username: "BrewHaha", password: 'password', city: 'Denver', state: "Colorado")

@games = Game.limit(25)

@game_1 = @games[0]
@game_2 = @games[1]
@game_3 = @games[2]
@game_4 = @games[3]
@game_5 = @games[4]
@game_6 = @games[5]
@game_7 = @games[6]
@game_8 = @games[7]
@game_9 = @games[8]
@game_10 = @games[9]
@game_11 = @games[10]
@game_12 = @games[11]
@game_13 = @games[12]
@game_14 = @games[13]
@game_15 = @games[14]
@game_16 = @games[15]
@game_17 = @games[16]
@game_18 = @games[17]
@game_19 = @games[18]
@game_20 = @games[19]
@game_21 = @games[20]
@game_22 = @games[21]
@game_23 = @games[22]
@game_24 = @games[23]
@game_25 = @games[24]

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

@event_1 = Event.create!(address: "3360 Alcott St", city: "Denver", state: "Colorado", zip: "80221", title: 'The crash pad', cancelled: false,
                         host_id: @user_1.id, game: @game_1.id, game_type: 'board game', date: "2023/10/01", start_time: "12:00", end_time: "14:00",
                         description: "Welcome back one and all to the weekly Scythe game at the Crash Pad. BYOB but no outside food!")
@event_2 = Event.create!(address: "2211 Hooker St", city: "Denver", state: "Colorado", zip: "80221", title: 'Casa del sol', cancelled: false,
                         host_id: @user_2.id, game: @game_2.id, game_type: 'board game', date: "2023/10/28", start_time: "18:00", end_time: "23:00",
                         description: "Wingspan meetup! We've got several copies so all you need to bring is your smile and your finest plumage.")
@event_3 = Event.create!(address: "2342 W Caley Ave", city: "Littleton", state: "Colorado", zip: "80120", title: "My mom's house", cancelled: false,
                         host_id: @user_3.id, game: @game_3.id, game_type: 'board game', date: "2023/10/15", start_time: "19:30", end_time: "22:00",
                         description: "Do you think you can beat my mom at Root? Come by at 7:30 pm and let's put that to the test.")
@event_4 = Event.create!(address: "4913 Steele St", city: "Denver", state: "Colorado", zip: "80216", title: 'The Game Den', cancelled: false,
                         host_id: @user_4.id, game: @game_4.id, game_type: 'board game', date: "2023/10/16", start_time: "12:00", end_time: "15:00",
                         description: "The inhabitants of mars need oxygen, heat, and oceans. But you know what they need most of all? Friends. Come meet the coolest game crew you'll ever know.")
@event_5 = Event.create!(address: "3122 Lawrence St", city: "Denver", state: "Colorado", zip: "80205", title: 'House of the Dragon', cancelled: false,
                         host_id: @user_5.id, game: @game_5.id, game_type: 'board game', date: "2023/10/15", start_time: "12:00", end_time: "19:00",
                         description: "We're starting early, so we should have plenty of time. If you're dropping in, reach out the event host ahead of time to talk about your character.")
@event_6 = Event.create!(address: "1325 Teller St", city: "Lakewood", state: "Colorado", zip: "80214", title: 'Rivendell Books', cancelled: false,
                         host_id: @user_6.id, game: @game_6.id, game_type: 'board game', date: "2023/10/04", start_time: "17:00", end_time: "21:00",
                         description: "We think it's been long enough since Covid that the idea of a pandemic can be fun again. Join in at Rivendell books! There's a tea shop next door.")
@event_7 = Event.create!(address: "3706 S Knox Ct", city: "Englewood", state: "Colorado", zip: "80110", title: 'Board of the Rings', cancelled: false,
                         host_id: @user_1.id, game: @game_8.id, game_type: 'board game', date: "2023/10/21", start_time: "08:00", end_time: "12:00",
                         description: "No jerks and no Johns! Come join our inviting crew at Board of the rings where we'll help defend the island from invaders. All are welcome!")
@event_8 = Event.create!(address: "1900 S Raritan St", city: "Denver", state: "Colorado", zip: "80223", title: 'The Game Knight', cancelled: false,
                         host_id: @user_2.id, game: @game_20.id, game_type: 'board game', date: "2023/10/08", start_time: "09:00", end_time: "17:00",
                         description: "Everdell today starting at 9 am. Bring nuts and berries to imitate the woodland creatures!")

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

# Game.create(bga_id: "12k3jbhgk235kjh", name: "Candy Land", min_players: 2, max_players: 4, min_playtime: 15, max_playtime: 21,
#             description: "<p><em>Candy Land</em> Candy Land (also Candyland) is a simple racing board game published by Hasbro. The game requires no reading and minimal counting skills,
#             making it suitable for young children. No strategy is involved as players are never required to make choices; only following directions is required. About one million copies
#             per year are sold</p>",
#             image_url: 'https://upload.wikimedia.org/wikipedia/en/thumb/d/de/Classic_Candy_Land_by_Winning_Moves.jpg/220px-Classic_Candy_Land_by_Winning_Moves.jpg', average_user_rating: 5,
#             average_strategy_complexity: 5)
