class User < ActiveRecord::Base
  # ActiveRecord::Base.establish_connection "servicedintsun"

  self.table_name = "mantis_user_table"

  has_many :bugs
end