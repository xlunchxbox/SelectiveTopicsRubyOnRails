require 'spec_helper'

describe Worker do
  before(:each) do
    @attr = { :last_name => 'Last', :first_name => 'First' }
  end

  describe 'instantiation' do
    it 'should require a last name' do
      no_last_name_worker = Worker.new(@attr.merge(:last_name => ''))
      no_last_name_worker.should_not be_valid
    end

    it 'should require a first name' do
      no_first_name_worker = Worker.new(@attr.merge(:first_name => ''))
      no_first_name_worker.should_not be_valid
    end

    it 'should create a new instance given valid attributes' do
      Worker.create!(@attr)
    end
  end
end
