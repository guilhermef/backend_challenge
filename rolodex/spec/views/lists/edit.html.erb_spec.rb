require 'spec_helper'

describe "lists/edit.html.erb" do
  before(:each) do
    @list = assign(:list, stub_model(List,
      :new_record? => false
    ))
  end

  it "renders the edit list form" do
    render

    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    assert_select "form", :action => list_path(@list), :method => "post" do
    end
  end
end
