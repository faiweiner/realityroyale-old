Show.destroy_all
Season.destroy_all

User.destroy_all
League.destroy_all
Participant.destroy_all

# ===== USERS ===== #
u1 = User.create({email: "sally@example.com", password: "aaaaaaaa", password_confirmation: "aaaaaaaa"})
u2 = User.create({email: "sue@example.com", password: "aaaaaaaa", password_confirmation: "aaaaaaaa"})
u3 = User.create({email: "kev@example.com", password: "aaaaaaaa", password_confirmation: "aaaaaaaa"})
u4 = User.create({email: "jack@example.com", password: "aaaaaaaa", password_confirmation: "aaaaaaaa"})

# ===== SHOWS, SEASONS & EPISODES ===== #
test_show = Show.create(name: 'Test Show', image: 'https://encrypted-tbn1.gstatic.com/images?q=tbn:ANd9GcRgiSJFsKMZnMZ8T1GVyTRWsQUUvAwL3cXyqtTGEpFkEPE4DnhAFnrtmlrQ', active: true)
show1 = Show.create(name: 'The Bachelor', image: '/assets/the_bachelor/logo.jpg', active: true)
show2 = Show.create(name: 'The Challenge', image: '/assets/the_challenge/thechallenge.jpg', active: true)

test_season = Season.create(name: 'Test Season', number: 1, show_id: test_show.id, country_origin: 1)
season1 = Season.create(name: 'Chris Soules', number: 19, show_id: show1.id, country_origin: 1)
season1ep1 = Episode.create(season_id: season1.id, air_date: '05/01/2015', survivor_count: 18, published: true, aired: false)
season1ep2 = Episode.create(season_id: season1.id, air_date: '12/01/2015', survivor_count: 15, published: true, aired: false)
season1ep3 = Episode.create(season_id: season1.id, air_date: '19/01/2015', survivor_count: 13, published: true, aired: false)
season1ep4 = Episode.create(season_id: season1.id, air_date: '26/01/2015', survivor_count: 11, published: true, aired: false)
season1ep5 = Episode.create(season_id: season1.id, air_date: '2/02/2015', survivor_count: 8, published: true, aired: false)
season1ep6 = Episode.create(season_id: season1.id, air_date: '9/02/2015', survivor_count: 5, published: true, aired: false)
season1ep7 = Episode.create(season_id: season1.id, air_date: '16/02/2015', survivor_count: 4, published: true, aired: false)
season1ep8 = Episode.create(season_id: season1.id, air_date: '23/02/2015', survivor_count: 3, published: true, aired: false)
season1ep9 = Episode.create(season_id: season1.id, air_date: '2/03/2015', survivor_count: 2, published: true, aired: false)
season1ep10 = Episode.create(season_id: season1.id, air_date: '9/03/2015', survivor_count: 1, published: true, aired: false)

# ===== LEAGUES ===== #
league1 = Fantasy.create(
	creator_id: u1.id, 
	name: 'Test Public Fantasy League', 
	season_id: season1.id,
	participation_cap: 5,
	draft_limit: 5,
	draft_date: '2016-01-06 21:00:00',
	draft_order: nil,
	league_key: nil,
	league_password: nil)

league2 = Elimination.create(
	creator_id: u1.id, 
	name: 'Test Public Elimination League', 
	season_id: season1.id,
	participation_cap: nil,
	draft_limit: nil,
	draft_date: '2016-01-06 21:00:00',
	draft_order: nil,
	league_key: nil,
	league_password: nil)

league3 = Elimination.create(
	creator_id: u2.id, 
	name: 'Test Private Elimination League', 
	season_id: season1.id,
	participation_cap: nil,
	draft_limit: nil,
	draft_date: '2016-01-06 21:00:00',
	draft_order: nil,
	private_access: true)

participant_ids = [u2.id, u3.id]

participant_ids.each do |id|
	Participant.create(league_id: league1.id, user_id: id)
end

