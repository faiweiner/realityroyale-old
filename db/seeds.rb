Show.destroy_all
Season.destroy_all

User.destroy_all
League.destroy_all

u1 = User.create({email: "sally@example.com", password: "aaaaaaaa", password_confirmation: "aaaaaaaa"})
u2 = User.create({email: "sue@example.com", password: "aaaaaaaa", password_confirmation: "aaaaaaaa"})
u3 = User.create({email: "kev@example.com", password: "aaaaaaaa", password_confirmation: "aaaaaaaa"})
u4 = User.create({email: "jack@example.com", password: "aaaaaaaa", password_confirmation: "aaaaaaaa"})

# ===== SHOWS & SEASONS ===== #
test_show = Show.create(
	name: 'Test Show', 
	image: 'https://encrypted-tbn1.gstatic.com/images?q=tbn:ANd9GcRgiSJFsKMZnMZ8T1GVyTRWsQUUvAwL3cXyqtTGEpFkEPE4DnhAFnrtmlrQ',
	active: true,
	published: false)

test_season = Season.create(
	name: 'Test Season',
	number: 1,
	show_id: 1,
	country_origin: 1)

# ===== LEAGUES ===== #
league1 = Fantasy.create(
	creator_id: u1.id, 
	name: 'Test Public Fantasy League', 
	season_id: test_season.id,
	type: 'Fantasy',
	participant_cap: 5,
	draft_limit: 5,
	draft_date: '2016-01-06 21:00:00',
	draft_order: nil,
	league_key: nil,
	league_password: nil)

league2 = Elimination.create(
	creator_id: u1.id, 
	name: 'Test Public Elimination League', 
	season_id: test_season.id,
	type: 'Elimination',
	participant_cap: nil,
	draft_limit: nil,
	draft_date: '2016-01-06 21:00:00',
	draft_order: nil,
	league_key: nil,
	league_password: nil)
