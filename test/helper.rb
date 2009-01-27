require 'rubygems'
require 'active_support'
require 'active_support/test_case'
require 'active_record'
require 'test/unit'
require 'shoulda'

require File.join(File.dirname(__FILE__), '..', 'lib', 'quick_scopes')
require File.join(File.dirname(__FILE__), 'models')

TEST_DB = File.join(File.dirname(__FILE__), 'test.sqlite3')

def setup_database
  File.unlink(TEST_DB) if File.exist?(TEST_DB)
  ActiveRecord::Base.establish_connection(
    'adapter' => 'sqlite3', 'timeout' => 5000, 'database' => TEST_DB
  )
  create_tables
  load_fixtures
end

def create_tables
  c = ActiveRecord::Base.connection

  c.create_table :authors, :force => true do |t|
    t.string :name
    t.timestamps
  end

  c.create_table :posts, :force => true do |t|
    t.string :title
    t.integer :author_id
    t.timestamps
  end

  c.create_table :comments, :force => true do |t|
    t.string :comment
    t.integer :author_id
    t.integer :post_id
    t.timestamps
  end
end

def load_fixtures
  john = Author.create(:name => 'John')
  jane = Author.create(:name => 'Jane')
  bruce = Author.create(:name => 'Bruce')
  shiela = Author.create(:name => 'Shiela')

  john_post1 = Post.create(:title => 'Post 1', :author => john, :created_at => Time.now - 3.days)
  john_post2 = Post.create(:title => 'Post 2', :author => john, :created_at => Time.now - 1.day)

  jane_post1 = Post.create(:title => 'Post 3', :author => jane, :created_at => Time.now - 3.days)
  jane_post2 = Post.create(:title => 'Post 4', :author => jane, :created_at => Time.now - 1.day)

  comment1 = john_post1.comments.create(:comment => 'A comment on post 1 by jane', :author => jane)
  comment2 = john_post1.comments.create(:comment => 'A comment on post 1 by bruce', :author => bruce)
  comment3 = john_post1.comments.create(:comment => 'A comment on post 1 by shiela', :author => shiela)

  comment4 = john_post2.comments.create(:comment => 'A comment on post 2 by jane', :author => jane)
  comment5 = john_post2.comments.create(:comment => 'A comment on post 2 by bruce', :author => bruce)
  comment6 = john_post2.comments.create(:comment => 'A comment on post 2 by shiela', :author => shiela)

  comment7 = jane_post1.comments.create(:comment => 'A comment on post 3 by john', :author => john)
  comment8 = jane_post1.comments.create(:comment => 'A comment on post 3 by bruce', :author => bruce)
  comment9 = jane_post1.comments.create(:comment => 'A comment on post 3 by shiela', :author => shiela)

  comment10 = jane_post2.comments.create(:comment => 'A comment on post 4 by john', :author => john)
  comment11 = jane_post2.comments.create(:comment => 'A comment on post 4 by bruce', :author => bruce)
  comment12 = jane_post2.comments.create(:comment => 'A comment on post 4 by shiela', :author => shiela)
end

setup_database
