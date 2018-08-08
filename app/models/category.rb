class Category < ActiveRecord::Base
	self.table_name = "mantis_category_table"

	has_many :bugs	
end