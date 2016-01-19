require 'test_helper'

class ReviewTest < ActiveSupport::TestCase
 test "the truth" do
     assert true
 end
 

  test 'valid comment can be saved' do
    @review = Review.create(comment: 'Hello, world!')
    assert_response :success
    assert @review.valid?
    assert @review.save
  end


  
  test 'should require review to be set' do
    @review = Review.create(comment: nil)
    assert  @review.invalid?
    assert  @review.errors[:comment]
    assert_equal 'can\'t be blank',  @review.errors[:comment].join
  end


test 'should require a comment with maximum of 150 characters long' do
    @review = Review.create(comment: 'x'*151)
    assert @review.invalid?
    assert_equal 'is too long (maximum is 150 characters)', @review.errors[:comment].join
  end
end