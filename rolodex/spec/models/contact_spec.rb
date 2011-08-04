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
  
  it "should delete a list of ids" do
    contact2 = Factory(:contact)
    contact3 = Factory(:contact)
    contact4 = Factory(:contact)
    
    Contact.all.should have(4).contact
    Contact.delete_ids [contact2.id, contact3.id, contact4.id]
    
    Contact.all.should have(1).contact
  end

end
