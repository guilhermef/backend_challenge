class Contact < ActiveRecord::Base

  has_many :phone_numbers
  has_many :addresses
  has_many :contact_lists
  has_and_belongs_to_many :lists

  validates :first_name, :presence => true, :uniqueness => {:scope => :last_name}
  validates_presence_of :last_name
  
  # validates_uniqueness_of :number, :scope => [:area_code, :contact_id]

  # add a self to a list
  def add_to_list(list)

  end
end
