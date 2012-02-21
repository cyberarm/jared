class Task < ActiveRecord::Base
 validates_presence_of :title, :desciption
 validates_uniqueness_of :title
 default_scope :order => 'created_at DESC'
end
