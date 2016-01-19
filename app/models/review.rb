class Review < ActiveRecord::Base
    belongs_to :book
    belongs_to :user
    
    # Confirm that user entered a comment and that it is no longer than 150 characters 
    validates :comment, :presence => true
    validates :comment, :length =>{maximum:150};

end
