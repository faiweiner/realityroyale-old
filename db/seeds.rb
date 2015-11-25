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

season1cont3 = Contestant.create(name: 'Amber', season_id: season1.id, age: 29, gender: 'female', image: '/assets/the_bachelor/season19/amber.jpg', occupation: 'Bartender', description: 'Hometown: Chicago, IL')
season1cont4 = Contestant.create(name: 'Ashley I.', season_id: season1.id, age: 26, gender: 'female', image: '/assets/the_bachelor/season19/ashleyi.jpg', occupation: 'Freelance Journalist', description: 'Hometown: Wayne, NJ')
season1cont5 = Contestant.create(name: 'Ashley S.', season_id: season1.id, age: 24, gender: 'female', image: '/assets/the_bachelor/season19/ashleys.jpg', occupation: 'Hair Stylist', description: 'Hometown: Brooklyn, NY')
season1cont6 = Contestant.create(name: 'Becca', season_id: season1.id, age: 25, gender: 'female', image: '/assets/the_bachelor/season19/becca.jpg', occupation: 'Chiropractic Assistant', description: 'Hometown: San Diego, CA')
season1cont8 = Contestant.create(name: 'Britt', season_id: season1.id, age: 27, gender: 'female', image: '/assets/the_bachelor/season19/britt.jpg', occupation: 'Waitress', description: 'Hometown: Hollywood, CA')
season1cont10 = Contestant.create(name: 'Carly', season_id: season1.id, age: 29, gender: 'female', image: '/assets/the_bachelor/season19/carly.jpg', occupation: 'Cruise Ship Singer', description: 'Hometown: Arlington, TX')
season1cont11 = Contestant.create(name: 'Jade', season_id: season1.id, age: 28, gender: 'female', image: '/assets/the_bachelor/season19/jade.jpg', occupation: 'Cosmetics Developer', description: 'Hometown: Los Angeles, CA')
season1cont12 = Contestant.create(name: 'Jillian', season_id: season1.id, age: 25, gender: 'female', image: '/assets/the_bachelor/season19/jillian.jpg', occupation: ' News Producer', description: 'Hometown: Washington, D.C.')
season1cont13 = Contestant.create(name: 'Juelia', season_id: season1.id, age: 30, gender: 'female', image: '/assets/the_bachelor/season19/juelia.jpg', occupation: 'Esthetician', description: 'Hometown: Portland, OR')
season1cont15 = Contestant.create(name: 'Kaitlyn', season_id: season1.id, age: 29, gender: 'female', image: '/assets/the_bachelor/season19/kaitlyn.jpg', occupation: 'Dance Instructor', description: 'Hometown: Vancouver, BC')
season1cont17 = Contestant.create(name: 'Kelsey', season_id: season1.id, age: 28, gender: 'female', image: '/assets/the_bachelor/season19/kelsey.jpg', occupation: 'Guidance Counselor', description: 'Hometown: Austin, TX')
season1cont19 = Contestant.create(name: 'Mackenzie', season_id: season1.id, age: 21, gender: 'female', image: '/assets/the_bachelor/season19/mackenzie.jpg', occupation: 'Dental Assistant', description: 'Hometown: Maple Valley, WA')
season1cont20 = Contestant.create(name: 'Megan', season_id: season1.id, age: 23, gender: 'female', image: '/assets/the_bachelor/season19/megan.jpg', occupation: 'Make-Up Artist', description: 'Hometown: Nashville, TN')
season1cont23 = Contestant.create(name: 'Nikki', season_id: season1.id, age: 26, gender: 'female', image: '/assets/the_bachelor/season19/nikki.jpg', occupation: 'Former NFL Cheerleader', description: 'Hometown: New York City, NY')
season1cont25 = Contestant.create(name: 'Samantha', season_id: season1.id, age: 27, gender: 'female', image: '/assets/the_bachelor/season19/samantha.jpg', occupation: 'Fashion Designer', description: 'Hometown: Los Angeles, CA')
season1cont28 = Contestant.create(name: 'Tracy', season_id: season1.id, age: 29, gender: 'female', image: '/assets/the_bachelor/season19/tracy.jpg', occupation: 'Fourth Grade Teacher', description: 'Hometown: Wellington, FL')
season1cont29 = Contestant.create(name: 'Trina', season_id: season1.id, age: 33, gender: 'female', image: '/assets/the_bachelor/season19/trina.jpg', occupation: 'Special Education Teacher', description: 'Hometown: San Clemente, CA')
season1cont30 = Contestant.create(name: 'Whitney', season_id: season1.id, age: 29, gender: 'female', image: '/assets/the_bachelor/season19/whitney.jpg', occupation: 'Fertility Nurse', description: 'Hometown: Chicago, IL')

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

