require 'test_helper'

class BookTest < ActiveSupport::TestCase
   test "the truth" do
     assert true
   end
   
   test 'should require title to be set' do
    @book = Book.create(title: nil)
    assert @book.invalid?
    assert @book.errors[:email]
    assert_equal 'can\'t be blank', @book.errors[:title].join
  end
  
  test 'should require course number to be set' do
    @book = Book.create(cnumber: nil)
    assert @book.invalid?
    assert @book.errors[:cnumber]
    assert_equal "can't be blankis the wrong length (should be 3 characters)", @book.errors[:cnumber].join
  end
  
  test 'should require a course number with length of 3 characters' do
    @book = Book.create(cnumber: '1234')
    assert @book.invalid?
    assert_equal 'is the wrong length (should be 3 characters)', @book.errors[:cnumber].join
  end
  
  test 'should require quality to be set' do
    @book = Book.create(quality: nil)
    assert @book.invalid?
    assert @book.errors[:quality]
    assert_equal "can't be blankis invalid", @book.errors[:quality].join
  end
  
   test 'should require correct quality format if quality has changed, allowing blank' do
    @book = Book.create(quality: '')
    assert @book.invalid?
    assert_not_equal 'is invalid', @book.errors[:quality].join
  end

  test 'should require publisher to be set' do
    @book = Book.create(publisher: nil)
    assert @book.invalid?
    assert @book.errors[:publisher]
    assert_equal 'can\'t be blank', @book.errors[:publisher].join
  end
  
  test 'should require department id to be set' do
    @book = Book.create(department_id: nil)
    assert @book.invalid?
    assert @book.errors[:department_id]
    assert_equal 'can\'t be blank', @book.errors[:department_id].join
  end
  
  test 'should require price to be set' do
    @book = Book.create(price: nil)
    assert @book.invalid?
    assert @book.errors[:price]
    assert_equal 'can\'t be blank', @book.errors[:price].join
  end
  
  test 'should require campus location to be set' do
    @book = Book.create(campus: nil)
    assert @book.invalid?
    assert @book.errors[:campus]
    assert_equal "can't be blankis invalid", @book.errors[:campus].join
  end
  
  test 'should require correct campus location format if campus has changed, allowing blank' do
    @book = Book.create(campus: '')
    assert @book.invalid?
    assert_not_equal 'is invalid', @book.errors[:campus].join

  
  end
end
