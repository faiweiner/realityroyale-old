# == Schema Information
#
# Table name: leagues
#
#  id                :integer          not null, primary key
#  creator_id        :integer          not null
#  name              :string(255)
#  season_id         :integer
#  type              :string(255)
#  participation_cap :integer
#  draft_limit       :integer
#  draft_date        :datetime
#  draft_order       :string(255)
#  league_key        :string(255)
#  league_password   :string(255)
#  private_access    :boolean          default(FALSE), not null
#  active            :boolean          default(FALSE), not null
#  published         :boolean          default(FALSE), not null
#  full              :boolean          default(FALSE), not null
#  locked            :boolean          default(FALSE), not null
#  created_at        :datetime
#  updated_at        :datetime
#

class League < ActiveRecord::Base
	belongs_to :season, inverse_of: :leagues
	has_many :participations
	has_many :users, through: :participations

	# -- Updates -- #
	before_save :set_league_key_pw, :set_draft_limit
	after_save :add_commissioner_participation
	after_initialize :toggle_full_field

	# -- Validations on create -- #
	validates :name, presence: true, length: {minimum: 3}, on: :create
	validates :creator_id, presence: true, on: :create
	validates :draft_date, presence: true, on: :create

	# ========================================================== #
	# ===== PUBLIC METHODS AVAILABLE (client/driven logic) ===== #
	# ========================================================== #

	# -- Search Methods -- #
	def self.search_by_key(query)
		joins(:season, :users).where(league_key: query).uniq.order('created_at DESC')
	end

	def self.search_by_season_name(query)
		includes(:season).joins(:season).where('season.name LIKE ?', '%#{query}%')
	end

	def self.search_by_show_name(query)
	end

	# -- Locking Methods -- #
	def lock_league
		self.update!(locked: true)
	end

	def unlock_league
		self.update!(locked: false)
	end

	# -- Participation Methods -- #
	def get_commissioners
		commissioners = self.participations.where(commissioner: true)
	end

	def add_new_commissioner(user_id)
		response = nil
		user = self.participations.select{|key| key.user_id == user_id }[0]
		if user.present?
			if user.commissioner == false
				user.update(commissioner: true)
				response = "This user is now a commissioner."
			else
				errors = "This user is already a league commissioner."
			end
		else
			errors = "This user is not a participant and cannot be added as a commissioner to this league!"
		end
		return response
	end

	# ========================================================== #
	# ===== PRIVATE METHODS ==================================== #
	# ========================================================== #
	
	private

	# ~~ League key and password ~~ #
	def gen_league_key
		self.league_key = SecureRandom.hex(5)
	end

	def gen_league_pw
		self.league_password = SecureRandom.hex(5)
	end

	def set_league_key_pw
		if private_access == false # if the league is public
			gen_league_key
		else # if private_access == true
			gen_league_key
			gen_league_pw
		end
	end	

	# ~~ Participation ~~ #

	def add_commissioner_participation 	# ON LEAGUE INITIALIZATION ONLY!
		league_id = self.id
		Participation.create(league_id: league_id, user_id: self.creator_id, commissioner: true) unless self.participations.where(user_id: creator_id).exists?
	end

	def participation_status
		available_spots = 0
		status = nil

		if self.id.nil?	# new league, not yet saved, no participant yet
			available_spots = self.participation_cap - self.participations.count + 1
			status = 'new league'
		else # existing league
			available_spots = self.participation_cap - self.participations.count
			status = 'open' if available_spots > 0
			status = 'full' if available_spots == 0
		end
		return status

	end

	# ~~ Draft limit ~~ #

	def gen_draft_limit
		season = Season.find(self.season_id)
		self.draft_limit = (season.contestants.count / self.participation_cap).floor
	end

	def set_draft_limit
		if participation_cap != nil
			gen_draft_limit
		end
	end

	# ~~ Updating ~~ #

	def toggle_full_field
		unless self.participation_cap.nil?	# proceed if the league's participation cap exists
			puts 'Checking if league is full...'
			puts participation_status
			if participation_status == 'full'
				self.update!(full: true)
			elsif participation_status == 'open'
				self.update!(full: false)
			end
		end
	end

end
