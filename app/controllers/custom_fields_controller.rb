class CustomFieldsController < ApplicationController
  def index
  	@custom_fields = CustomField.dept
  end
end
