class User < ActiveRecord::Base
	validates :email, presence: true, uniqueness: true
	validates :date_of_birth, presence: true
	# different method
	validate :at_least_18
	validate :em_belongs_to

	def at_least_18
		if date_of_birth > 18.years.ago
			errors.add(:date_of_birth, "Must be at least 18 years old")
		end
	end

	def em_belongs_to
		# if !email.ends_with?("ryanbrunner.ca")
		# 	errors.add(:email, "Your e-mail must belong to ryanbrunner.ca domain")
		# end
		if not email.ends_with?("ryanbrunner.ca")
			errors.add(:email, "Your e-mail must belong to ryanbrunner.ca domain")
		end

		# unless email.ends_with?("ryanbrunner.ca")
		# 	errors.add(:email, "Your e-mail must belong to ryanbrunner.ca domain")
		# end
	end
end
