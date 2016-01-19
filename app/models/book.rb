class Book < ActiveRecord::Base
    belongs_to :user
    belongs_to :department
    has_many :reviews
    
    # Validate parameters user set to database standards 
    
    has_attached_file :avatar, :styles => { :medium => "250x350>", :thumb => "325x475" }, :default_url => "bookcover.jpg"
    validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/
    
    validates :title, :cnumber, :quality, :publisher, :department_id, :price, :campus, :presence => true
    #validates_presence_of :cnumber, :message => "can't be empty"  
    validates :cnumber, :length => {:is => 3}
    validates_format_of :quality, :campus, :with => /[a-zA-Z]*/
    
    def self.human_attribute_name(attr, options = {})
        attr == :cnumber ? 'Course Number' : super
    end
    
end






