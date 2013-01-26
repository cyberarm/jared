class Task < ActiveRecord::Base
 validates_presence_of :title, :due, :description
 default_scope :order => 'due DESC'
end
