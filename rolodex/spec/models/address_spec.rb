require 'spec_helper'

describe Address do
  before(:each) do
    @address = Factory(:address)
  end

  it { should belong_to(:contact) }
  it { should belong_to(:address_type) }

  it { should validate_presence_of(:address) }
  it { should validate_presence_of(:zip) }
  it { should validate_presence_of(:city) }
  it { should validate_presence_of(:state) }
  it { should validate_presence_of(:contact_id) }
  it { should validate_presence_of(:address_type_id) }

  it { should validate_format_of(:zip).with('55416') }
  #<Bug on shoulda lib>
  
  it { should validate_format_of(:zip).with("55416-6789").with_message(/invalid/) }
  
  ["554316", "554s6", "5 416", "554166789", "55416-67892", " 55416 "].each do |value| 
    it { should validate_format_of(:zip).not_with(value).with_message(/invalid/) }
  end
  #</Bug on shoulda lib>
  
  it "should delegate address_type_name to address type" do
    address_type = Factory(:address_type, :name => 'home')
    @address = Factory(:address, :address_type => address_type )
    @address.address_type = address_type
    @address.address_type_name.should == 'home'
  end
end
