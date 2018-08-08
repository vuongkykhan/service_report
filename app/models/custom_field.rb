class CustomField < ActiveRecord::Base
	self.table_name = "mantis_custom_field_string_table"

	belongs_to :bug

	scope :danhmuc, -> { where field_id: 2 } 
	scope :property, -> { where field_id: 3 } 
	scope :factory, -> { where field_id: 4 }
	scope :dept, -> { where field_id: 5 }  
	scope :ip_address, -> { where field_id: 6 }
	scope :without_card_note_contact, -> { where.not(field_id: 8).where.not(field_id: 9).where.not(field_id: 10) }  
end
