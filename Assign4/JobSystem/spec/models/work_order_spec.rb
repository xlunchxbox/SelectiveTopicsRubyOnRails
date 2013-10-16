require 'spec_helper'

describe WorkOrder do
  before(:each) do
    @attr = { :details => 'A New Detail', :status => 'Completed' }
  end

  describe 'instantiation' do
    it 'should require details' do
      no_details = WorkOrder.new(@attr.merge(:details => ''))
      no_details.should_not be_valid
    end

    it 'should require status' do
      no_status = WorkOrder.new(@attr.merge(:status => ''))
      no_status.should_not be_valid
    end
    
    it 'should create a new instance given valid attributes' do
      WorkOrder.create!(@attr)
    end
  end
end
