module ModelHelper
	# -- Toggling boolean attributes --#
	def toggle_active_field
		case self.active
		when false; self.update!(active: true)
		when true; self.update!(active: false)
		end
	end

	def toggle_published_field
		case self.published
		when false; self.update!(published: true) 
		when true; self.update!(published: false)
		end
	end

	def toggle_locked_field
		case self.locked
		when false; self.update!(locked: true) 
		when true; self.update!(locked: false)
		end
	end
end