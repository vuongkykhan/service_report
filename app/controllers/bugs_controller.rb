class BugsController < ApplicationController
	def index
		@bugs = Bug.with_exist_handler.without_non_exist_user.last(1000)
	end
end