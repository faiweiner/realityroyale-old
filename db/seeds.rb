Show.destroy_all
Season.destroy_all

User.destroy_all

# reset leagues
League.destroy_all
Elimination.destroy_all
Fantasy.destroy_all

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
