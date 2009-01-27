require File.join(File.dirname(__FILE__), 'helper.rb')

class QuickScopesTest < Test::Unit::TestCase
  def setup
  end

  [Post, Author, Comment].each do |model|
    context "The #{model} model" do
      should "have an order scope" do
        assert Post.scopes.include?(:order)
      end

      should "have a limit scope" do
        assert Post.scopes.include?(:limit)
      end

      should "have a with scope" do
        assert Post.scopes.include?(:with)
      end

      should "have a where scope" do
        assert Post.scopes.include?(:where)
      end

      should "have a offset scope" do
        assert Post.scopes.include?(:offset)
      end
    end
  end

  context "using the order named_scope" do
    setup {
      john = Author.find_by_name('John')
      @posts = john.posts.order('created_at desc')
    }

    should "return results in the correct order" do
      assert_equal 'Post 2', @posts[0].title
    end
  end

  context "using the limit named_scope" do
    setup {
      @post = Post.first
    }

    should "return 3 comments when unlimited" do
      assert_equal 3, @post.comments.size
    end

    should "return 2 comments when limited to 2" do
      #Not sure why I have to add to_a?
      assert_equal 2, @post.comments.limit(2).to_a.size
    end
  end

  context "using the offset named_scope" do
    setup {
      @post = Post.first
    }

    should "return 2 comments when offset by 1" do
      assert_equal 2, @post.comments.limit(3).offset(1).to_a.size
    end

    should "return 1 comments when offset by 2" do
      #Not sure why I have to add to_a?
      assert_equal 1, @post.comments.limit(3).offset(2).to_a.size
    end
  end

  context "using the where named_scope" do
    setup {
      @post = Post.first
    }

    should "restrict the results" do
      assert_equal 1, @post.comments.where(:author_id => Author.find_by_name('Jane').id).to_a.size
    end
  end
end
