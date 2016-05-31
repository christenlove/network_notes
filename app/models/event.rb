class Event < ActiveRecord::Base

has_many :contacts , :class_name => "Contact", :foreign_key => "event_id"
belongs_to :user , :class_name => "User", :foreign_key => "user_id"

validates :title, :presence => true
validates :held_on, :presence => true
validates :title, :uniqueness => {:scope => :held_on}
end
