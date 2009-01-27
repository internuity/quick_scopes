class ActiveRecord::Base
  named_scope :order, lambda { |order|       
    { :order => order }
  }

  named_scope :limit, lambda { |limit|       
    { :limit => limit }
  }

  named_scope :with,  lambda { |*include|    
    { :include => include.size == 1 ? include[0] : include }
  }

  named_scope :where, lambda { |*conditions| 
    { :conditions => conditions.size == 1 ? conditions[0] : conditions }
  }

  named_scope :offset, lambda { |offset|       
    { :offset => offset }
  }
end
