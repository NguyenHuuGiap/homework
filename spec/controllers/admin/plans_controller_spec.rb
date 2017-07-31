 require 'rails_helper'

RSpec.describe Admin::PlansController, type: :controller do

  describe "GET #index" do
    let(:plan){FactoryGirl.create:plan}

    it "returns a success response" do
      get :index, params: {}
      expect(response).to be_success
    end
  end

  # describe "GET #show" do
  #   let(:plan){FactoryGirl.create:plan}

  #   context "success show" do
  #     it "success show" do
  #       get :show, xhr: true, params: {id: plan.id}
  #       expect(response).to have_http_status :success
  #     end
  #   end

  #   context "faild get" do
  #     it "faild show" do
  #       get :show, xhr: true, params: {id: {}}
  #       expect(response).to redirect_to admin_plans_path
  #     end
  #   end
  # end

  describe "GET #new" do
    context "success new" do
      it "success new" do
        get :new, xhr: true, params: {}
        expect(response).to have_http_status :success
      end
    end
  end

  describe "GET #edit" do
    let(:plan){FactoryGirl.create:plan}

    context "success edit" do
      it "success edit" do
        get :edit, xhr: true, params: {id: plan.id}
        expect(response).to have_http_status :success
      end
    end

    context "faild get" do
      it "faild edit" do
        get :edit, xhr: true, params: {id: {}}
        expect(response).to redirect_to admin_terms_path
      end
    end
  end

  # describe "POST #create" do

  #   context "success create" do
  #     before do
  #       post :create, params: {term: {length: 12, unit: "days"}}
  #     end

  #     it "get a flash error" do
  #       expect(flash[:success]).to be_present
  #     end

  #     it "save success" do
  #       expect(response).to redirect_to admin_terms_path
  #     end
  #   end

  #   context "faild create" do
  #     before do
  #       post :create, params: {term: {length: 12}}
  #     end

  #     it "get a flash error" do
  #       expect(flash[:danger]).to be_present
  #     end

  #     it "save faild" do
  #       expect(response).to redirect_to admin_terms_path
  #     end
  #   end
  # end

  # describe "POST #update" do
  #   let(:term){FactoryGirl.create:term}

  #   context "success update" do
  #     before do
  #       put :update, params: {id: term, term: FactoryGirl.attributes_for(:term, length: 10)}
  #     end

  #     it "get a flash error" do
  #       expect(flash[:success]).to be_present
  #     end

  #     it "save success" do
  #       expect(response).to redirect_to admin_terms_path
  #     end
  #   end

  #   context "faild update" do
  #     before do
  #       put :update, params: {id: term, term: FactoryGirl.attributes_for(:term, length: "1 day")}
  #     end

  #     it "get a flash error" do
  #       expect(flash[:danger]).to be_present
  #     end

  #     it "save faild" do
  #       expect(response).to redirect_to admin_terms_path
  #     end
  #   end
  # end

  # describe "DELETE #destroy" do
  #   let(:term){FactoryGirl.create:term}

  #   context "success destroy" do
  #     before do
  #       delete :destroy, params: {id: term.id}
  #     end

  #     it "get a flash error" do
  #       expect(flash[:success]).to be_present
  #     end

  #     it "save success" do
  #       expect(response).to redirect_to admin_terms_path
  #     end
  #   end

  #   context "faild destroy" do
  #     before do
  #       delete :destroy, params: {id: {}}
  #     end

  #     it "get a flash error" do
  #       expect(flash[:danger]).to be_present
  #     end

  #     it "save faild" do
  #       expect(response).to redirect_to admin_terms_path
  #     end
  #   end
  # end
end
