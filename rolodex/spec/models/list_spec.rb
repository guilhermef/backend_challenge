require 'spec_helper'

describe List do
  before(:each) do
    @list = Factory(:list)
  end

  it { should validate_presence_of(:name) }

  it { should have_and_belong_to_many(:contacts) }

end
