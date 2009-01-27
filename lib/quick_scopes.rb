class ActiveRecord::Base
  named_scope :order, lambda { |order| {:order => order} }
  named_scope :sort, lambda { |order| {:order => order} }
  named_scope :limit, lambda { |limit| {:limit => limit} }
  named_scope :include, lambda { |include| {:include => include } }
end
