require 'test_helper'

class SiteLayoutTest < ActionDispatch::IntegrationTest
  
   test "the truth" do
     assert true
   end

  test "layout links on homepage" do
    get root_path
    assert_template 'books/_welcome'
    assert_template 'books/index'
    assert_template 'layouts/_footer'
    assert_template 'layouts/application'
    assert_template 'layouts/_header'
    assert_select "a[href=?]", root_path, count: 2
    assert_select "a[href=?]", about_path
    assert_select "a[href=?]", contact_path
  end



   test "layout links on contact page" do
     get contact_path
     assert_template 'static_pages/contact'
   	 assert_select "a[href=?]", root_path, count: 2
     assert_select "a[href=?]", about_path
     assert_select "a[href=?]", contact_path
   end
   
   test "layout links on about page" do
     get about_path
     assert_template 'static_pages/about'
     assert_template 'layouts/_header'
     assert_template 'layouts/_footer'
     assert_template 'layouts/application'
   	 assert_select "a[href=?]", root_path, count: 2
     assert_select "a[href=?]", about_path
     assert_select "a[href=?]", contact_path
   end
   
   test "layout links on profile page" do
     get profile_path
     assert_template 'static_pages/profile'
     assert_template 'layouts/_header'
     assert_template 'layouts/_footer'
     assert_template 'layouts/application'
   	 assert_select "a[href=?]", root_path, count: 2
     assert_select "a[href=?]", about_path
     assert_select "a[href=?]", contact_path
   end

   test 'about and browse site' do
    get_via_redirect about_path
    assert_response :success
    
   end
  
   test 'contact and browse site' do
    get_via_redirect contact_path
    assert_response :success
    
   end 
   test 'login and browse site' do
    get_via_redirect user_session_path
    assert_response :success
   end
    
   
  
  test "should get new" do
    get_via_redirect new_book_review_path(book_id: Book.first.id )
    assert_response:success
  end
  
    
   
  

end
