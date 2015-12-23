require 'rails_helper'

RSpec.describe ServicesController, type: :controller do

  describe "GET #index" do
  end

  describe "GET #show" do
  end

  describe "GET #new" do

    context "when not logged in" do 

      it "redirects to login page" do 
        get :new 
        expect(response).to redirect_to new_user_session_path
      end
    end
  end

  describe "GET #edit" do
  end

  describe "POST #create" do
    
    context "when logged in" do

      before :each do 
        sign_in
      end

      it "creates a new service in database" do  
        expect { post :create, service: attributes_with_foreign_keys(:service) }.to change{Service.count}.by(1)
      end

      it "creates a new address in database" do 
        expect { post :create, service: attributes_with_foreign_keys(:service) }.to change{Address.count}.by(1)
      end
    end

    context "when not logged in" do

      before :each do 
        sign_in nil
      end

      it "does not change service database" do  
        expect { post :create, service: { area: "ares" }}.not_to change{Service.count}
      end

      it "does not change address database" do 
        expect { post :create, service: { area: "ares", address_attributes: { street: "street" }}}.not_to change{Address.count}
      end

    end
  end

  describe "PUT #update" do
    context "with valid params" do
    end

    context "with invalid params" do
    end
  end

  describe "DELETE #destroy" do
  end

end
