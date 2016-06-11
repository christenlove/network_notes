class Contact < ActiveRecord::Base

belongs_to :event , :class_name => "Event", :foreign_key => "event_id"

validates :name, :presence => true
validates :company, :presence => true
validates :name, :uniqueness => {:scope => :company}

end
