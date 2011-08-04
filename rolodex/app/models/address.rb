class Address < ActiveRecord::Base
  belongs_to :address_type
  belongs_to :contact
  
  validates_presence_of :address, :zip, :city, :state
  validates_format_of :zip, :with => /^\d{5}(\-\d{4})?$/
  
  delegate :name, :to => :address_type, :prefix => true
end
