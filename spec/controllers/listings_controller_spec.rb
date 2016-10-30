require 'rails_helper'

RSpec.describe ListingsController, type: :controller do

	
	describe "GET #index" do 
		let(:search_param) { "Best" }
		before(:each) do
			Listing.searchkick_index.refresh
    end

 		it "returns http success" do
      get :index
      expect(response).to have_http_status(:success)
    end
	end

	describe "GET #show" do
		before(:each) do
			@list1 = FactoryGirl.create(:listing) 
    end

    it "assigns the requested list to @list" do
    	get :show, id: @list1.id
    	expect(assigns(:list)).to eq(@list1)
    end
	end

	describe "GET #new" do
		it "create a new Listing" do
			sign_in
			get :new
			expect(assigns(:list)).to be_a_new(Listing)
		end
	end

	describe "POST #create" do
		let( :valid_params )          { { listing: { title: "some house", description: "more house", rate: 50 }} }
    let( :invalid_params )        { { listing: { title: "123" }} }

    before(:each) do
			sign_in
    end

    context "when valid params" do
      it "should save listing" do      	
        post :create, valid_params
        expect(Listing.find_by(valid_params[:listing])).not_to eq nil
      end

      it "should redirect to list page" do
        post :create, valid_params
        expect(response).to redirect_to( listing_path(assigns(:list)) )
      end
    end

    context "when invalid params" do
      it "should rerender create page" do
        post :create, invalid_params
        expect(Listing.find_by(invalid_params[:listing])).to eq nil
        expect(response).to render_template('new')
      end
    end
	end

	describe "PUT #update" do
		let( :edit_params )       	  {  { title: "abc" } }

		before(:each) do
			@user = sign_in
			@list1 = FactoryGirl.create(:listing, user_id: @user.id) 
    end

    it "update the respective param and redirect to show page" do
    	put :update, :id => @list1.id, listing: edit_params
    	expect(assigns(:list).title).to eq(edit_params[:title])
    	expect(response).to redirect_to( listing_path(assigns(:list)) )
    end
	end

	describe "DELETE #destroy" do
		before(:each) do
			@user = sign_in
			@list1 = FactoryGirl.create(:listing, user_id: @user.id) 
    end

    it "delete the post and redirect to listing index" do
    	delete :destroy, :id => @list1.id
    	 expect(Listing.find_by(id: @list1.id)).to eq nil
    	 expect(response).to redirect_to( listings_path) 
    end
	end
end