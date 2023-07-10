# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

@user_1 = User.create!(username: 'user 1', password: 'password', city: 'city 1', state: 'state 1', lat: 1.1111111, lon: 1.11111111)
@user_2 = User.create!(username: 'user 2', password: 'password', city: 'city 2', state: 'state 2', lat: 2.1111111, lon: 2.11111111)
@user_3 = User.create!(username: 'user 3', password: 'password', city: 'city 3', state: 'state 3', lat: 3.1111111, lon: 3.11111111)
@user_4 = User.create!(username: 'user 4', password: 'password', city: 'city 4', state: 'state 4', lat: 4.1111111, lon: 4.11111111)
@user_5 = User.create!(username: 'user 5', password: 'password', city: 'city 5', state: 'state 5', lat: 5.1111111, lon: 5.11111111)

GameFactory.new.build_games(GameService.new.all_games)

@event_1 = Event.create!(date: '2023/01/01', address: '1 One street', city: '1 city', state: '1 state', zip: 11_111, title: '1 title', cancelled: false, description: '1 description',
                         host_id: @user_1.id, game: Game.first.id, game_type: 'board game', lat: 1.1111111, lon: 1.1111111)
@event_2 = Event.create!(date: '2023/02/02', address: '2 One street', city: '2 city', state: '2 state', zip: 22_222, title: '2 title', cancelled: false, description: '2 description',
                         host_id: @user_2.id, game: Game.second.id, game_type: 'board game', lat: 2.1111111, lon: 2.1111111)

@user_event_1 = UserEvent.create!(user_id: @user_1.id, event_id: @event_1.id)
@user_event_2 = UserEvent.create!(user_id: @user_2.id, event_id: @event_1.id)
@user_event_3 = UserEvent.create!(user_id: @user_3.id, event_id: @event_1.id)
@user_event_4 = UserEvent.create!(user_id: @user_2.id, event_id: @event_2.id)
@user_event_5 = UserEvent.create!(user_id: @user_4.id, event_id: @event_2.id)
@user_event_6 = UserEvent.create!(user_id: @user_5.id, event_id: @event_2.id)
@user_event_6 = UserEvent.create!(user_id: @user_1.id, event_id: @event_2.id)

@user_game_1 = UserGame.create!(user_id: @user_1.id, game: Game.offset(34).limit(1).first)
@user_game_2 = UserGame.create!(user_id: @user_1.id, game: Game.offset(35).limit(1).first)
@user_game_3 = UserGame.create!(user_id: @user_1.id, game: Game.offset(36).limit(1).first)
@user_game_4 = UserGame.create!(user_id: @user_1.id, game: Game.offset(37).limit(1).first)
@user_game_5 = UserGame.create!(user_id: @user_1.id, game: Game.offset(38).limit(1).first)
@user_game_6 = UserGame.create!(user_id: @user_2.id, game: Game.offset(39).limit(1).first)
@user_game_7 = UserGame.create!(user_id: @user_2.id, game: Game.offset(40).limit(1).first)
@user_game_8 = UserGame.create!(user_id: @user_2.id, game: Game.offset(12).limit(1).first)
@user_game_9 = UserGame.create!(user_id: @user_2.id, game: Game.offset(13).limit(1).first)
@user_game_10 = UserGame.create!(user_id: @user_2.id, game: Game.offset(14).limit(1).first)
