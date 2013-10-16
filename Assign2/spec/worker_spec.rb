require File.expand_path('../../setup', __FILE__)
require File.expand_path('../../worker', __FILE__)

describe Worker do
  before( :each ) do
    @attr = { :last_name => 'Last', :first_name => 'First' }
  end

  describe 'instantiations' do
  	it 'should create a new instance given valid attributes' do
      Worker.create!(@attr)
    end

    it 'should have a last name present' do
      no_last_name_worker = Worker.new(@attr.merge(:last_name => ''))
      no_last_name_worker.should_not be_valid
    end

    it 'should have a first name present' do
      no_first_name_worker = Worker.new(@attr.merge(:first_name => ''))
      no_first_name_worker.should_not be_valid
    end
  end

  describe 'work_order associations' do
  	before(:each) do
  		@worker = Worker.create(@attr)
  		@work_order1 = FactoryGirl.create(:work_order, :worker => @worker) #maybe include date?
  		@work_order2 = FactoryGirl.create(:work_order, :worker => @worker)
  	end

  	it 'should have a work_orders attribute' do
  		@worker.should respond_to(:work_orders)
  	end

  	it 'should destroy associated work_orders upon worker deletion' do
  		@worker.destroy
  		[@work_order1, @work_order2].each do |work_order|
  			WorkOrder.find_by_id(work_order.id).should be_nil
  		end

  		#Maybe this is better:
  		#
  		#lambda do
  		#  WorkOrder.find(work_order.id)
  		#end.should raise_error(ActiveRecord::RecordNotFound)
  	end
  end
end
