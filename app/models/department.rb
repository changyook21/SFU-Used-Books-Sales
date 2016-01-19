class Department < ActiveRecord::Base
    has_many :books
    
    # Confirm that user entered a department and that it is unique to the database 
    validates :name, :presence => true
    validates_uniqueness_of :name
end
