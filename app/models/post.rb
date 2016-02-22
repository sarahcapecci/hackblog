class Post < ActiveRecord::Base
	# validates presence
	validates :title, :content, :author, :category, presence: true
	validates :title, uniqueness: true

	# # validates numericality
	# validates :category, numericality: true, if: :method_name_that_should_return_true
	# # regex
	# validates :category, format: /@/
	# 			:field, :typeOfValidation {options}
	# validates :category, presence: true,
	# 					 inclusion: {in: ['news', 'fun']}

	# to check:
	# entry.valid? (t/f) or entry.errors to check errors, entry.errors[:title]

	# def to_s
	# 	self.title
	# end
	
	def lead
		self.content.to_s.first(100) + '...'
	end

	def duplicated(other_post)
		if self.title == other_post.title
			"Duplicated"
		end
	end
	# or

	# def ==(other)
	# 	self.title == other.title	
	# end

	def by?(check_author)
		if self.author == check_author.to_s
			return true
		end
	end

	def same_category?(other_post)
		if self.category == other_post.category
			return true
		else
			return false
		end
	end


	def self.entitled(value)
		# lower(field)
		where("lower(title) LIKE ? or lower(content) LIKE ?", "%#{value.downcase}%", "%#{value.downcase}%")

		# SELECT * FROM posts
		# WHERE lower(title) LIKE '%awesome%'
		# % -> any number of characters before/after
	end
end
