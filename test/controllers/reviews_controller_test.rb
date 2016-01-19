require 'test_helper'

class ReviewsControllerTest < ActionController::TestCase
   test "the truth" do
     assert true
   end
   
 

 
   test "should create review" do
   @review = Review.create(comment:"lol", user_id: 1, book_id:4)
    
      
    assert_response :success
    assert @review.valid?
    assert @review.save
   
  end

  

  
end
