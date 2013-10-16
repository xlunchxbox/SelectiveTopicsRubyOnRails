require 'spec_helper'

describe WorkersController do
  render_views

  describe "GET request for 'index'" do
    it 'should be successful' do
      get :index
      response.should be_success
    end
  end

  describe "GET request for 'new'" do
    it 'should be successful' do
      get :new
      response.should be_success
    end
  end

  describe "POST request for 'create'" do
    describe 'failure' do
      before(:each) do
        @attr = { :first_name => '', :last_name => '' }
      end

      # it 'should not create an invalid worker' do
      #   lambda do
      #     post :create, :worker => @attr
      #   end.should_not change(Worker, :count)
      # end

      # it "should render the 'new' page" do
  #       post :create, :worker => @attr
  #       response.should render_template('new')
  #     end
    end

    describe 'success' do
      before(:each) do
        @attr = { :last_name => 'Last', :first_name => 'First' }
      end

      # it 'should create a worker' do
      #   lambda do
      #     post :create, :worker => @attr
      #   end.should change(Worker, :count).by(1)
      # end

      # it 'should redirect to the workers page' do
  #       post :create, :worker => @attr
  #       response.should redirect_to(root_path)
  #     end
    end
  end

  describe "GET request for 'edit'" do
    before(:each) do
      @worker = Worker.create(:first_name => 'SampleFirst', :last_name => 'SampleLast')
    end

    it 'should be successful' do
      get :edit, :id => @worker
      response.should be_success
    end
  end

  describe "GET request for 'show'" do
    before(:each) do
      @worker = Worker.create(:first_name => 'SampleFirst', :last_name => 'SampleLast')
    end

    it 'should be successful' do
      get :show, :id => @worker
      response.should be_success
    end
  end

  describe "PUT request for 'update'" do
    before(:each) do
      @worker = Worker.create(:first_name => 'SampleFirst', :last_name => 'SampleLast')
    end

    describe 'failure' do
      before(:each) do
        @attr = { :last_name => '', :first_name => '' }
      end

      it "should not change the worker's attributes" do
        put :update, :id => @worker, :worker => @attr
        @worker.reload
        @worker.first_name.should_not == @attr[:first_name]
        @worker.last_name.should_not == @attr[:last_name]
      end

      # it "should render the 'edit' page" do
      #   put :update, :id => @worker, :worker => @attr
      #   response.should render_template('edit')
      # end
    end

    describe 'success' do
      before(:each) do
        @attr = { :first_name => 'NewFirst', :last_name => 'NewLast' }
      end

      it "should change the worker's attributes" do
        put :update, :id => @worker, :worker => @attr
        @worker.reload
        @worker.first_name.should == @attr[:first_name]
        @worker.last_name.should == @attr[:last_name]
      end

      # it 'should redirect to the root path' do
   #      put :update, :id => @worker, :worker => @attr
   #      response.should redirect_to(root_path)
   #    end
    end
  end

  describe "DELETE request for 'destroy'" do
    before(:each) do
      @worker = Worker.create(:first_name => 'SampleFirst', :last_name => 'SampleLast')
    end

    it 'should delete the worker' do
      lambda do
        delete :destroy, :id => @worker
      end.should change(Worker, :count).by(-1)
    end

    # it 'should redirect to the root path' do
    #   delete :destroy, :id => @worker
    #   response.should redirect_to(root_path)
    # end
  end
end
