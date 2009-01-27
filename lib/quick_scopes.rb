class ActiveRecord::Base
  named_scope :order, lambda { |order| {:order => order} }
  named_scope :limit, lambda { |limit| {:limit => limit} }
  named_scope :with, lambda { |include| {:include => include } }
end
