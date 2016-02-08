class Post < ActiveRecord::Base

	def lead
		self.content.first(100)
	end

	def duplicated(other_post)
		if self.title == other_post.title
			"Duplicated"
		end
	end

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
end
