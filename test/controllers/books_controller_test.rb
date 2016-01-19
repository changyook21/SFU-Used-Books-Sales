require 'test_helper'

class BooksControllerTest < ActionController::TestCase
  test "the truth" do
    assert true
  end

  test "should get index" do 
    get :index
    assert_response :success
  end
  
  
  test "should find username" do 
    get :index, params: { username:"demo" }
    assert_response :success
  end
  
  test "should find title" do 
    get :index, params: { title:"Software Engineering" }
    assert_response :success
  end
 
  test "should find department" do 
    get :index, params: { department: 1 }
    assert_response :success
  end
  test "should find cname and cnumber" do 
    get :index, params: { cname:"CMPT", cnumber:276 }
    assert_response :success
  end
  test "should not get edit" do
    get :edit, id: Book.first.id
    assert_redirected_to user_session_path
  end
  
  test "should create book" do
    Book.create(id: Book.first.id,
                 title: Book.first.title,
                 cname: Book.first.cname,
                 cnumber: Book.first.cnumber,
                 quality: Book.first.quality,
                 publisher: Book.first.publisher,
                 campus: Book.first.campus,
                 price: Book.first.price,
                 department_id: Book.first.department_id
    )
    
      
    assert_response :success
   
  end
  
 test "should not destroy book" do
    # Since we are not logged in, book remains the same
   
      delete :destroy, id: Book.first.id
  
    assert_redirected_to user_session_path
  end
 

  test "should not update event" do
    # Not logged in, can not edit/delete books.
    patch :update, id: Book.first.id, book: {
                                              title: Book.first.title,
                                              cnumber: Book.first.cnumber,
                                              quality: Book.first.quality,
                                              publisher: Book.first.publisher,
                                              campus: Book.first.campus,
                                              price: Book.first.price,
                                              department_id: Book.first.department_id }
    assert_redirected_to user_session_path 
  end
  

end
