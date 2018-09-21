class BugField < ActiveRecord::Base
  self.table_name = "mantis_custom_field_string_table"

  belongs_to :bug
  belongs_to :field
end

# SELECT 
#   COUNT(cus_f.field_id), cus_f.value, cus.username 
# FROM 
#   `mantis_custom_field_string_table` AS cus_f 
# JOIN 
#   `mantis_bug_table` AS bug ON cus_f.bug_id = bug.id 
# JOIN 
#   `mantis_user_table` AS cus ON bug.handler_id = cus.id 
# WHERE
#   cus_f.field_id = 2 GROUP BY cus_f.value, cus.username 
# ORDER BY `cus`.`username` ASC