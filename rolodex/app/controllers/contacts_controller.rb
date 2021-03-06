class ContactsController < InheritedResources::Base
  custom_actions :collection => :destroy_ids
  layout false
  
  index! do |format|
    format.partial { render :partial => "index" }
  end
  
  show! do |format|
    format.partial { render :partial => "show" }
    format.vcf { send_data @contact.to_vcard.to_s }
  end
  
  create! do |success, failure|
    failure.html { render :partial => "form", :status => 200 }
    success.html { render :nothing , :status => 200 }
  end
  
  destroy! do |success|
    success.html { redirect_to root_path }
  end
  
  new! do |format|
    format.partial { render :partial => "form" }
  end
  
  edit! do |format|
    format.partial { render :partial => "form" }
  end
  
  def destroy_ids
    Contact.destroy_all :id => params[:ids]
    destroy_ids! do |success|
      success.html { redirect_to root_path }
    end
  end
  
  protected
  def collection
    if params[:q]
      @contacts ||= end_of_association_chain.where("first_name LIKE ?", "#{params[:q]}%")
    else
      @contacts ||= end_of_association_chain.all
    end
  end
  
end
