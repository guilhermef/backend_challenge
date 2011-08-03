class ContactsController < InheritedResources::Base
  layout false
  
  index! do |format|
    format.partial { render :partial => "index" }
  end
  
  show! do |format|
    format.partial { render :partial => "show" }
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
  
  protected
  def collection
    if params[:q]
      @contacts ||= end_of_association_chain.where("first_name LIKE ?", "#{params[:q]}%")
    else
      @contacts ||= end_of_association_chain.all
    end
  end
  
end
