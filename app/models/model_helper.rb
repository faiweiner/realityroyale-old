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
	end

	# Contestant, Elimination, Fantasy, League, Season and Show
	# FIXME! Restrict method to above models only.
	def toggle_published_field
		case self.published
		when false; self.update!(published: true) 
		when true; self.update!(published: false)
		end
	end

	# Elimination, Fantasy, League, Roster, Round
	# FIXME! Restrict method to above models only.
	def toggle_locked_field
		case self.locked
		when false; self.update!(locked: true) 
		when true; self.update!(locked: false)
		end
	end

	def toggle_favorite_field
		case self.favorite
		when false; self.update!(favorite: true) 
		when true; self.update!(favorite: false)
		end
	end
end