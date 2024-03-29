module ModelHelper
	# FIXME! Restrict modules to league's commissioner only!
	
	# -- Toggling boolean attributes --#

	# Contestant, Elimination, Fantasy, League, Season and Show
	# FIXME! Restrict method to above models only.
	def toggle_active_field
		case self.active
		when false; self.update!(active: true)
		when true; self.update!(active: false)
		end
		# FIXME! add error rescue
	end

	# Contestant, Elimination, Fantasy, League, Season and Show
	# FIXME! Restrict method to above models only.
	def toggle_published_field
		case self.published
		when false; self.update!(published: true) 
		when true; self.update!(published: false)
		end
		# FIXME! add error rescue
	end

	# Elimination, Fantasy, League, Roster, Round
	# FIXME! Restrict method to above models only.
	def toggle_locked_field
		case self.locked
		when false; self.update!(locked: true) 
		when true; self.update!(locked: false)
		end
		# FIXME! add error rescue
	end

	def toggle_favorite_field
		case self.favorite
		when false; self.update!(favorite: true) 
		when true; self.update!(favorite: false)
		end
		# FIXME! add error rescue
	end

	# League
	# FIXME! Might not need, already covered in "check_capacity" method
	def toggle_full_field
		puts "used toggle"
		case self.full
		when false; self.update!(full: true) 
		when true; self.update!(full: false)
		end
		# FIXME! add error rescue
	end
end