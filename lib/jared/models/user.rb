class User < ActiveRecord::Base
 validates_presence_of :name, :zip
 validates_length_of :zip, :minimum=>5, :maximum=>5
 default_scope :order => 'created_at DESC'
end
