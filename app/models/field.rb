class Field < ActiveRecord::Base
  self.table_name = "mantis_custom_field_table"
  self.inheritance_column = :_type_disabled

  has_many :bug_fields
  has_many :bugs, through: :bug_fields
  scope :danhmuc, -> { where id: 1 } 
end