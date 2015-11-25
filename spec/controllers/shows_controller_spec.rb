require 'spec_helper'

describe ShowsController do

  # This should return the minimal set of attributes required to create a valid
  # Show. As you add validations to Show, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) { {  } }

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # ShowsController. Be sure to keep this updated too.
  let(:valid_session) { {} }

  describe "GET index" do
    it "assigns all shows as @shows" do
      5.times{ Factory :show }
      get :index, {}, valid_session
      assigns(:shows).should eq([show])
    end
  end

  describe "GET show" do
    it "assigns the requested show as @show" do
      show = Show.create! valid_attributes
      get :show, {:id => show.to_param}, valid_session
      assigns(:show).should eq(show)
    end
  end

  describe "GET new" do
    it "assigns a new show as @show" do
      get :new, {}, valid_session
      assigns(:show).should be_a_new(Show)
    end
  end

  describe "GET edit" do
    it "assigns the requested show as @show" do
      show = Show.create! valid_attributes
      get :edit, {:id => show.to_param}, valid_session
      assigns(:show).should eq(show)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new Show" do
        expect {
          post :create, {:show => valid_attributes}, valid_session
        }.to change(Show, :count).by(1)
      end

      it "assigns a newly created show as @show" do
        post :create, {:show => valid_attributes}, valid_session
        assigns(:show).should be_a(Show)
        assigns(:show).should be_persisted
      end

      it "redirects to the created show" do
        post :create, {:show => valid_attributes}, valid_session
        response.should redirect_to(Show.last)
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved show as @show" do
        # Trigger the behavior that occurs when invalid params are submitted
        Show.any_instance.stub(:save).and_return(false)
        post :create, {:show => {  }}, valid_session
        assigns(:show).should be_a_new(Show)
      end

      it "re-renders the 'new' template" do
        # Trigger the behavior that occurs when invalid params are submitted
        Show.any_instance.stub(:save).and_return(false)
        post :create, {:show => {  }}, valid_session
        response.should render_template("new")
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      it "updates the requested show" do
        show = Show.create! valid_attributes
        # Assuming there are no other shows in the database, this
        # specifies that the Show created on the previous line
        # receives the :update_attributes message with whatever params are
        # submitted in the request.
        Show.any_instance.should_receive(:update).with({ "these" => "params" })
        put :update, {:id => show.to_param, :show => { "these" => "params" }}, valid_session
      end

      it "assigns the requested show as @show" do
        show = Show.create! valid_attributes
        put :update, {:id => show.to_param, :show => valid_attributes}, valid_session
        assigns(:show).should eq(show)
      end

      it "redirects to the show" do
        show = Show.create! valid_attributes
        put :update, {:id => show.to_param, :show => valid_attributes}, valid_session
        response.should redirect_to(show)
      end
    end

    describe "with invalid params" do
      it "assigns the show as @show" do
        show = Show.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        Show.any_instance.stub(:save).and_return(false)
        put :update, {:id => show.to_param, :show => {  }}, valid_session
        assigns(:show).should eq(show)
      end

      it "re-renders the 'edit' template" do
        show = Show.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        Show.any_instance.stub(:save).and_return(false)
        put :update, {:id => show.to_param, :show => {  }}, valid_session
        response.should render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested show" do
      show = Show.create! valid_attributes
      expect {
        delete :destroy, {:id => show.to_param}, valid_session
      }.to change(Show, :count).by(-1)
    end

    it "redirects to the shows list" do
      show = Show.create! valid_attributes
      delete :destroy, {:id => show.to_param}, valid_session
      response.should redirect_to(shows_url)
    end
  end

end
