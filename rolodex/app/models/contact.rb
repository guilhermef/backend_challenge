require 'vpim/vcard'

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
  
  def to_vcard
    card = Vpim::Vcard::Maker.make2 do |maker|
      maker.add_name do |name|
        name.given = first_name
        name.additional = middle_name
        name.family = last_name
      end
        
      addresses.each do |a|
          maker.add_addr do |addr|
            addr.street = a.address
            addr.locality = a.city
            addr.locality = a.state
            addr.country = a.country
            addr.postalcode = a.zip
          end
      end
      phone_numbers.each do |p|
        maker.add_tel(p.full_number)
      end
    end
  end
  
end
