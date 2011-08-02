class RolodexController < ApplicationController
  def index
    @contacts = Contact.order :first_name
  end

end
