require 'spec_helper'

describe FacultyMember do
  before(:each) do
    @attr = { :first_name => 'SampleFirst', :last_name => 'SampleLast', :position => 'Professor',
      :department => 'Computer Science', :university_id => 123456, :email => 'sample@sample.com',
      :phone => 1234567890, :password => 'foobar', :password_confirmation => 'foobar' }
  end

  describe 'instantiation' do
    it 'should require a last name' do
      no_last_name_faculty = FacultyMember.new(@attr.merge(:last_name => ''))
      no_last_name_faculty.should_not be_valid
    end

    it 'should require a first name' do
      no_first_name_faculty = FacultyMember.new(@attr.merge(:first_name => ''))
      no_first_name_faculty.should_not be_valid
    end

    it 'should require a position' do
      no_position_faculty = FacultyMember.new(@attr.merge(:position => ''))
      no_position_faculty.should_not be_valid
    end

    it 'should require a department' do
      no_department_faculty = FacultyMember.new(@attr.merge(:department => ''))
      no_department_faculty.should_not be_valid
    end

    it 'should require a university ID' do
      no_university_id_faculty = FacultyMember.new(@attr.merge(:university_id => nil))
      no_university_id_faculty.should_not be_valid
    end

    it 'should require an email address' do
      no_email_faculty = FacultyMember.new(@attr.merge(:email => ''))
      no_email_faculty.should_not be_valid
    end

    it 'should require a password' do
      no_password_faculty = FacultyMember.new(@attr.merge(:password => '', :password_confirmation => ''))
      no_password_faculty.should_not be_valid
    end

    it 'should require a matching password confirmation' do
      mismatch_password_faculty = FacultyMember.new(@attr.merge(:password_confirmation => 'mismatch'))
      mismatch_password_faculty.should_not be_valid
    end

    it 'should require a remember token' do
      faculty = FacultyMember.create(@attr)
      faculty.remember_token.should_not be_blank
    end

    it 'should create an instance given valid attributes' do
      FacultyMember.create!(@attr)
    end
  end

  describe 'validations' do
    before(:each) do
      @faculty = FacultyMember.new(@attr)
      @unique_attr = { :university_id => 999999, :email => 'unique@sample.com', :phone => 9999999999 }
    end

    it 'should reject an invalid phone number length' do
      numbers = [12345, 1234567890123, 1394]
      numbers.each do |invalid_number|
        @faculty.phone = invalid_number
        @faculty.should_not be_valid
      end
    end

    it 'should accept a phone number with 10 digits' do
      numbers = [1234567890, 2819139139]
      numbers.each do |valid_number|
        @faculty.phone = valid_number
        @faculty.should be_valid
      end
    end

    it 'should reject a duplicate phone number' do
      @faculty.save
      duplicate_phone_faculty = FacultyMember.new(@attr.merge(@unique_attr))
      duplicate_phone_faculty.phone = @attr[:phone]
      duplicate_phone_faculty.should_not be_valid
    end

    it 'should reject a duplicate email address' do
      @faculty.save
      duplicate_email_faculty = FacultyMember.new(@attr.merge(@unique_attr))
      duplicate_email_faculty.email = @attr[:email]
      duplicate_email_faculty.should_not be_valid
    end

    it 'should reject a duplicate university ID' do
      @faculty.save
      duplicate_id_faculty = FacultyMember.new(@attr.merge(@unique_attr))
      duplicate_id_faculty.university_id = @attr[:university_id]
      duplicate_id_faculty.should_not be_valid
    end
  end

  describe 'associations' do
    before(:each) do
      @faculty = FactoryGirl.create(:faculty_member)
    end

    describe 'with courses' do
      before(:each) do
        @course = FactoryGirl.create(:course, :faculty_member => @faculty)
      end

      it 'should have a courses attribute' do
        @faculty.should respond_to(:courses)
      end

      it 'should destroy associated courses upon faculty member deletion' do
        @faculty.destroy
        Course.find_by_id(@course.id).should be_nil
      end
    end

    describe 'with researches' do
      before(:each) do
        @research = FactoryGirl.create(:research, :faculty_member => @faculty)
      end

      it 'should have a researches attribute' do
        @faculty.should respond_to(:researches)
      end

      it 'should destroy associated researches upon faculty member deletion' do
        @faculty.destroy
        Research.find_by_id(@research.id).should be_nil
      end
    end

    describe 'with publications' do
      before(:each) do
        @publication = FactoryGirl.create(:publication, :faculty_member => @faculty)
      end

      it 'should have a publications attribute' do
        @faculty.should respond_to(:publications)
      end

      it 'should destroy associated publications upon faculty member deletion' do
        @faculty.destroy
        Publication.find_by_id(@publication.id).should be_nil
      end
    end

    describe 'with degrees' do
      before(:each) do
        @degree = FactoryGirl.create(:degree, :faculty_member => @faculty)
      end

      it 'should have a degrees attribute' do
        @faculty.should respond_to(:degrees)
      end

      it 'should destroy associated degrees upon faculty member deletion' do
        @faculty.destroy
        Degree.find_by_id(@degree.id).should be_nil
      end
    end

    describe 'with employments' do
      before(:each) do
        @employment = FactoryGirl.create(:employment, :faculty_member => @faculty)
      end

      it 'should have an employments attribute' do
        @faculty.should respond_to(:employments)
      end

      it 'should destroy the associated employments upon faculty member deletion' do
        @faculty.destroy
        Employment.find_by_id(@employment.id).should be_nil
      end
    end

    describe 'with awards' do
      before(:each) do
        @award = FactoryGirl.create(:award, :faculty_member => @faculty)
      end

      it 'should have an awards attribute' do
        @faculty.should respond_to(:awards)
      end

      it 'should destroy the associated awards upon faculty member deletion' do
        @faculty.destroy
        Award.find_by_id(@award.id).should be_nil
      end
    end
  end
end
