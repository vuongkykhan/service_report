class BugsController < ApplicationController
	def index
		@bugs = Bug.with_exist_handler.without_non_exist_user.last(5)
		@users = User.without_reporter.without_custom_name
		@service_categories = BugField.where(field_id: 2).group(:value).count(:field_id)
	end
end
