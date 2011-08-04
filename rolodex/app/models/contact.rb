class Contact < ActiveRecord::Base
  default_scope order(:first_name)

  has_many :phone_numbers, :dependent => :destroy
  has_many :addresses, :dependent => :destroy
  has_many :contact_lists
  has_and_belongs_to_many :lists

  validates :first_name, :presence => true, :uniqueness => {:scope => :last_name}
  validates_presence_of :last_name
  
  accepts_nested_attributes_for :phone_numbers, :addresses, :allow_destroy => true
  
  # validates_uniqueness_of :number, :scope => [:area_code, :contact_id]

  # add a self to a list
  def add_to_list(list)

  end
  
  def self.delete_ids(ids)
    contacts = find ids
    contacts.map(&:delete)
  end
end
