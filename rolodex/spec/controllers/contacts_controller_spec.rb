require 'spec_helper'

describe ContactsController do

  context "GET" do
    
    before do
      @contact = Factory(:contact)
    end
    
    describe "index" do
      it "assigns all contacts as @contacts" do
        get :index, :format => :partial
        assigns(:contacts).should eq([@contact])
      end
    end

    describe "show" do
      it "assigns the requested contact as @contact" do
        get :show, :format => :partial, :id => @contact.id
        assigns(:contact).should eq(@contact)
      end
    end
    
    describe "show vcard" do
      it "assigns the requested contact as @contact" do
        get :show, :format => :vcf, :id => @contact.id
        assigns(:contact).should eq(@contact)
        response.should_not render_template("contacts/_show")
        response.should be_ok
      end
    end

    describe "new" do
      it "assigns a new contact as @contact" do
        get :new, :format => :partial
        assigns(:contact).should be_a_new(Contact)
      end
    end

    describe "edit" do
      it "assigns the requested contact as @contact" do
        get :edit, :format => :partial, :id => @contact.id.to_s
        assigns(:contact).should eq(@contact)
      end
    end
    
    describe "search" do
      it "assigns all contacts as @contacts" do
        contact = Factory(:contact, :first_name => "joana")
        contact2 = Factory(:contact, :first_name => "joão")
        contact3 = Factory(:contact, :first_name => "joaquim")
        get :index, :format => :partial, :q => "joa"
        assigns(:contacts).should eq([contact, contact3])
      end
    end
    
  end

  context "POST create" do
    
    describe "with valid params" do
      it "creates a new Contact" do
        expect {
          post :create, :contact => valid_attributes
        }.to change(Contact, :count).by(1)
      end

      it "assigns a newly created contact as @contact" do
        post :create, :contact => valid_attributes
        assigns(:contact).should be_a(Contact)
        assigns(:contact).should be_persisted
      end

    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved contact as @contact" do
        # Trigger the behavior that occurs when invalid params are submitted
        Contact.any_instance.stub(:save!).and_return(false)
        post :create, :contact => {}
        assigns(:contact).should be_a_new(Contact)
      end

      it "re-renders the 'new' template" do
        Contact.any_instance.stub(:save!).and_return(false)
        post :create, :contact => {}
        response.should render_template("contacts/_form")
      end
    end
  end

  context "PUT update" do
    
    describe "with valid params" do
      it "updates the requested contact" do
        contact = Contact.create! valid_attributes
        Contact.any_instance.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => contact.id, :contact => {'these' => 'params'}
      end

      it "assigns the requested contact as @contact" do
        contact = Contact.create! valid_attributes
        put :update, :id => contact.id, :contact => valid_attributes
        assigns(:contact).should eq(contact)
      end

      it "redirects to the contact" do
        contact = Contact.create! valid_attributes
        put :update, :id => contact.id, :contact => valid_attributes
        response.should redirect_to(contact)
      end
    end

    describe "with invalid params" do
      it "assigns the contact as @contact" do
        contact = Contact.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        Contact.any_instance.stub(:save).and_return(false)
        put :update, :id => contact.id.to_s, :contact => {}
        assigns(:contact).should eq(contact)
      end

      # it "re-renders the 'edit' template" do
      #   contact = Contact.create! valid_attributes
      #   # Trigger the behavior that occurs when invalid params are submitted
      #   Contact.any_instance.stub(:save).and_return(false)
      #   put :update, :id => contact.id.to_s, :contact => {}
      #   response.should render_template("edit")
      # end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested contact" do
      contact = Contact.create! valid_attributes
      expect {
        delete :destroy, :id => contact.id
      }.to change(Contact, :count).by(-1)
    end

    it "redirects to the contacts list" do
      contact = Contact.create! valid_attributes
      delete :destroy, :id => contact.id
      response.should redirect_to(root_url)
    end
    
    it "multiple contacts redirects to the contacts list" do
      contact = Factory(:contact)
      contact2 = Factory(:contact)
      contact3 = Factory(:contact)
      delete :destroy_ids, :ids => [contact.id, contact2.id, contact3.id]
      response.should redirect_to(root_url)
    end
  end
  
  def valid_attributes
    Factory.attributes_for(:contact)
  end

end
