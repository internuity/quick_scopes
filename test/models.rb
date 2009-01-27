class Author < ActiveRecord::Base
  has_many :posts
  has_many :comments
end

class Post < ActiveRecord::Base
  has_many :comments
  belongs_to :author
end

class Comment < ActiveRecord::Base
  belongs_to :post
  belongs_to :author
end
