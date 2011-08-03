class Type < ActiveRecord::Base
  self.abstract_class = true
  
  AVALIABLE_TYPES = %w( home office )
  
  validates_inclusion_of :name, :in => AVALIABLE_TYPES
  
  def self.avaliable
    AVALIABLE_TYPES
  end
end
