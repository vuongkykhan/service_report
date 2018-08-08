class User < ActiveRecord::Base
  # ActiveRecord::Base.establish_connection "servicedintsun"

  self.table_name = "mantis_user_table"

  has_many :bugs, :foreign_key => "handler_id", :class_name => "Bug"
  scope :without_reporter, -> {where.not access_level: 25}

 #  def most_purchased
	#   group_by("self.id")
	#   .pluck("users.username, sum(self.bugs) as count_jobs")
	# end

  def count_jobs
  	self.bugs.count
  end
end