require 'spec_helper'

describe WorkOrdersController do
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
        @attr = { :details => '', :status => '' }
      end

      # it 'should not create an invalid work order' do
      #   lambda do
      #     post :create, :work_order => @attr
      #   end.should_not change(WorkOrder, :count)
      # end

      # it "should render the 'new' page" do
      #   post :create, :work_order => @attr
      #   response.should render_template('new')
      # end
    end

    describe 'success' do
      before(:each) do
        @attr = { :details => 'Details', :status => 'Created' }
      end

      # it 'should create a work order' do
      #   lambda do
      #     post :create, :work_order => @attr
      #   end.should change(WorkOrder, :count).by(1)
      # end

      # it 'should redirect to the work orders page' do
      #   post :create, :work_order => @attr
      #   response.should redirect_to(root_path)
      # end
    end
  end
  
  describe "GET request for 'edit'" do
    before(:each) do
      @work_order = WorkOrder.create(:details => 'Details', :status => 'Created')
    end

    it 'should be successful' do
      get :edit, :id => @work_order
      response.should be_success
    end
  end

  describe "GET request for 'show'" do
    before(:each) do
      @work_order = WorkOrder.create(:details => 'Details', :status => 'Created')
    end

    it 'should be successful' do
      get :show, :id => @work_order
      response.should be_success
    end
  end
  
  describe "PUT request for 'update'" do
    before(:each) do
      @work_order = WorkOrder.create(:details => 'Details', :status => 'Created')
    end

    describe 'failure' do
      before(:each) do
        @attr = { :details => '', :status => '' }
      end

      it "should not change the work orders attributes" do
        put :update, :id => @work_order, :work_order => @attr
        @work_order.reload
        @work_order.details.should_not == @attr[:details]
        @work_order.status.should_not == @attr[:status]
      end

      it "should render the 'edit' page" do
        put :update, :id => @work_order, :work_order => @attr
        response.should render_template('edit')
      end
    end

    describe 'success' do
      before(:each) do
        @attr = { :details => 'Details', :status => 'Created' }
      end

      it "should change the work orders attributes" do
        put :update, :id => @work_order, :work_order => @attr
        @work_order.reload
        @work_order.details.should == @attr[:details]
        @work_order.status.should == @attr[:status]
      end

      # it 'should redirect to the root path' do
      #   put :update, :id => @work_order, :work_order => @attr
      #   response.should redirect_to(root_path)
      # end
    end
  end

  describe "DELETE request for 'destroy'" do
    before(:each) do
      @work_order = WorkOrder.create(:details => 'Details', :status => 'Created')
    end

    it 'should delete the work order' do
      lambda do
        delete :destroy, :id => @work_order
      end.should change(WorkOrder, :count).by(-1)
    end

    # it 'should redirect to the root path' do
    #   delete :destroy, :id => @work_order
    #   response.should redirect_to(work_orders_path)
    # end
  end
end
