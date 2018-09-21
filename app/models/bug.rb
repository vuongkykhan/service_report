class Bug < ActiveRecord::Base
  # ActiveRecord::Base.establish_connection "servicedintsun"
  enum status: { 
    open: 10,
    feedback: 20, 
    acknowledged: 30, 
    confirmed: 40, 
    assigned: 50,
    resolved: 80,
    closed: 90
  }

  self.table_name = "mantis_bug_table"

  # belongs_to :user
  # belongs_to :reporter, :foreign_key => :reporter_id, :primary_key => :id
  # belongs_to :handler, :foreign_key => :handler_id, :primary_key => :id
  belongs_to :reporter, class_name: :User
  belongs_to :handler, class_name: :User
  belongs_to :category
  has_many :custom_fields
  has_many :bug_fields
  has_many :fields, through: :bug_fields

  scope :bug_has_closed, -> { where status: 90 }
  scope :with_exist_handler, -> { where.not(handler_id: 0) }
  scope :without_non_exist_user, -> { where.not(handler_id: 3).where.not(handler_id: 178) }

  def count_field
    self.custom_fields.count  
  end 
end