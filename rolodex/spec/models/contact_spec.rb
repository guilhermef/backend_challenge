require 'spec_helper'

describe Contact do
  before(:each) do
    @contact = Factory(:contact)
  end

  it { should have_many(:phone_numbers) }
  it { should have_many(:addresses) }

  it { should validate_presence_of(:first_name) }
  it { should validate_presence_of(:last_name) }

  it { should validate_uniqueness_of(:first_name).
                  scoped_to(:last_name) }

  it { should have_and_belong_to_many(:lists) }

end
