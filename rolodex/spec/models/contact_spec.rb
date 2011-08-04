require 'spec_helper'

describe Contact do
  before(:each) do
    @contact = Factory(:contact)
  end

  it { should have_many(:phone_numbers) }
  it { should have_many(:addresses) }
  
  it { expect { Factory(:contact, :addresses_attributes => [Factory.attributes_for(:address)]) }.to change(Address, :count).by(1) }

  it { should validate_presence_of(:first_name) }
  it { should validate_presence_of(:last_name) }

  it { should validate_uniqueness_of(:first_name).
                  scoped_to(:last_name) }

  it { should have_and_belong_to_many(:lists) }
  
  it "should generate a vcard string" do
    contact = Factory(:contact, :first_name => "Guilherme", :middle_name => "Francisco", :last_name => "Souza")
    contact.addresses << Factory(:address)
    contact.phone_numbers << Factory(:phone_number, :area_code => "123", :number => "1234567")
    contact.to_vcard.to_s.should == File.read(Rails.root.join("spec/fixtures/contact.vcf"))
  end

end
