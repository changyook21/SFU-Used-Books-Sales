require 'test_helper'


class UserTest < ActiveSupport::TestCase
 
  
   test 'should require username to be set' do
    @user = User.create(username: nil)
    assert @user.invalid?
    assert @user.errors[:username]
    assert_equal 'can\'t be blank', @user.errors[:username].join
  end
  
  test 'should require uniqueness of username if username has changed, allowing blank' do
    existing_user = User.create

    @user = User.create(username: '')
    assert @user.invalid?
    assert_no_match(/taken/, @user.errors[:username].join)

    @user.username = existing_user.username
    assert @user.invalid?
    assert_match('can\'t be blank', @user.errors[:username].join)

    
  end
  
   test 'should require email to be set' do
    @user = User.create(email: nil)
    assert @user.invalid?
    assert @user.errors[:email]
    assert_equal 'can\'t be blank', @user.errors[:email].join
  end

  test 'should require uniqueness of email if email has changed, allowing blank' do
    existing_user = User.create

    @user = User.create(email: '')
    assert @user.invalid?
    assert_no_match(/taken/, @user.errors[:email].join)

    @user.email = existing_user.email
    assert @user.invalid?
    assert_match('can\'t be blank', @user.errors[:email].join)

    
  end
  
  test 'should require password when updating/resetting password' do
    @user = User.create

    @user.password = ''
    @user.password_confirmation = ''

    assert @user.invalid?
    assert_equal 'can\'t be blank', @user.errors[:password].join
  end

  test 'should require confirmation when updating/resetting password' do
   @user = User.create
    @user.password_confirmation = 'another_password'
    assert @user.invalid?

   
      assert_equal 'doesn\'t match Password', @user.errors[:password_confirmation].join
    
  end

  test 'should require a password with minimum of 8 characters' do
    @user = User.create(password: '123456', password_confirmation: '123456')
    assert @user.invalid?
    assert_equal 'is too short (minimum is 8 characters)', @user.errors[:password].join
  end

  test 'should require a password with maximum of 72 characters long' do
    @user = User.create(password: 'x'*73, password_confirmation: 'x'*73)
    assert @user.invalid?
    assert_equal 'is too long (maximum is 72 characters)', @user.errors[:password].join
  end

 
  

  test 'should not be included in objects with invalid API' do
    assert_raise RuntimeError do
      Class.new.send :include, Devise::Models::Validatable
    end
  end

  test 'required_fields should be an empty array' do
    assert_equal Devise::Models::Validatable.required_fields(User), []
  end
   

end