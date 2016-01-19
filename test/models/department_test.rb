require 'test_helper'

class DepartmentTest < ActiveSupport::TestCase
   test "the truth" do
     assert true
   end
   test 'should require department name to be set' do
    @department = Department.create(name: nil)
    assert  @department.invalid?
    assert  @department.errors[:name]
    assert_equal 'can\'t be blank',  @department.errors[:name].join
  end
  
  
  
  test 'should require uniqueness of department name' do
    existing_department = Department.create

    @department = Department.create(name: '')
    assert @department.invalid?
    assert_no_match(/taken/, @department.errors[:name].join)

    @department.name = existing_department.name
    assert @department.invalid?
    assert_match('can\'t be blank', @department.errors[:name].join)

    
  end
   

end
