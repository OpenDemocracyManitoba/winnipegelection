require 'spec'

$LOAD_PATH.unshift(File.dirname(__FILE__))
$LOAD_PATH.unshift(File.join(File.dirname(__FILE__), '..', 'lib'))
require 'rubygems'
require 'active_support'
require 'active_record'
require 'action_controller'
require 'action_controller/test_process'
require 'action_view/test_case'
require 'paged_scopes'

ActiveRecord::Base.establish_connection(:adapter => 'sqlite3', :dbfile => ':memory:')
ActiveRecord::Schema.define do
  create_table "users", :force => true do |t|
    t.column "name",  :text
  end
  create_table "articles", :force => true do |t|
    t.column "user_id",  :integer
    t.column "title", :text
    t.column "published_at", :datetime
  end
  create_table "comments", :force => true do |t|
    t.column "article_id", :integer
    t.column "user_id", :integer
  end
  create_table "contributions", :force => true do |t|
    t.column "article_id", :integer
    t.column "user_id", :integer
  end
end

class ::User < ActiveRecord::Base
  has_many :articles
  has_many :recent_articles, :order => "published_at DESC", :conditions => [ "published_at IS NOT :nil", { :nil => nil } ], :class_name => "Article"
  has_many :contributions
  has_many :shared_articles, :through => :contributions, :source => :article
end
class ::Article < ActiveRecord::Base
  belongs_to :user
  has_many :comments
  named_scope :untitled, :conditions => { :title => nil }
  named_scope :including_user, :include => :user
  named_scope :with_user, :joins => 'INNER JOIN users ON users.id = articles.user_id'
  named_scope :with_named_user, :joins => 'INNER JOIN users ON users.id = articles.user_id', :conditions => [ 'users.name IS NOT :nil', { :nil => nil } ]
  named_scope :ordered_by_user_name, :joins => 'INNER JOIN users ON users.id = articles.user_id', :conditions => [ 'users.name IS NOT :nil', { :nil => nil } ], :order => 'users.name'
  named_scope :with_comments, :joins => 'INNER JOIN comments AS article_comments ON article_comments.article_id = articles.id', :group => 'articles.id'
  named_scope :first_three_with_comments, :joins => 'INNER JOIN comments AS article_comments ON article_comments.article_id = articles.id', :group => 'articles.id', :limit => 3
  named_scope :with_multiple_comments, :include => :comments, :joins => 'INNER JOIN (SELECT count(id) AS count, article_id FROM comments GROUP BY article_id) article_comments ON article_comments.article_id = articles.id', :conditions => 'article_comments.count > 1'
  named_scope :first_three, :limit => 3
  named_scope :two_through_four, :limit => 3, :offset => 1
  named_scope :descending_id, :order => 'articles.id DESC'
end
class ::Comment < ActiveRecord::Base
  belongs_to :article
end
class ::Contribution < ActiveRecord::Base
  belongs_to :article
  belongs_to :user
end

User.create(:name => "user #1")
User.create(:name => nil)
User.create(:name => "user #3")
9.times do |n|
  shared_article = User.first.articles.create
  User.all.each_with_index do |user, i|
    user.articles.create
    user.articles.create(:title => "Article #%03d" % Article.count)
    published_article = user.articles.create(:title => "Article #%03d" % Article.count, :published_at => n.weeks.ago)
    n.times { published_article.comments << Comment.new }
    user.articles.create(:published_at => n.weeks.ago)
    user.shared_articles << shared_article unless user == User.first
  end
  n.times { shared_article.comments << Comment.new }
end

module ControllerHelpers
  def in_instance(instance, &block)
    instance.instance_eval do
      extend Spec::Matchers
      instance_eval(&block)
    end
  end
  
  def in_controller(controller, &block)
    controller.copy_instance_variables_from(self)
    in_instance controller do
      stub!(:params).and_return({})
      instance_eval(&block)
    end
  end
end

module RoutingHelpers
  def draw_routes(&block)
    ActionController::Routing::Routes.draw(&block)
  end

  def drawing_routes(&block)
    lambda { draw_routes(&block) }
  end

  def number_of_routes
    ActionController::Routing::Routes.routes.size
  end

  def named_routes
    ActionController::Routing::Routes.named_routes
  end

  def recognise_path(method, path)
    request = ActionController::TestRequest.new
    request.request_method = method
    ActionController::Routing::Routes.recognize_path(path, ActionController::Routing::Routes.extract_request_environment(request))
  rescue ActionController::RoutingError, ActionController::MethodNotAllowed
    nil
  end
end

module Contexts
  def in_contexts(&block)
    [
      [ "a scoped ActiveRecord class",        "Article.scoped({})"           ],
      [ "a has_many association",             "User.last.articles"           ],
      [ "an ordered has_many association",    "User.last.recent_articles"    ],
      [ "a has_many, :through association",   "User.last.shared_articles"    ] # not tested for habtm!
    ].each do |base_type, base|
      [ 
        [ "",                                         "" ],
        [ "scoped with :conditions",                  ".untitled" ],
        [ "scoped with :include",                     ".including_user" ],
        [ "scoped with :joins",                       ".with_user" ],
        [ "scoped with :joins & :conditions",         ".with_named_user" ],
        [ "scoped with :joins, :conditions & :order", ".ordered_by_user_name" ],
        [ "scoped with :joins & :group",              ".with_comments" ],
        [ "scoped with :joins, :group & :limit",      ".first_three_with_comments" ],
        [ "scoped with :includes, :joins & subquery", ".with_multiple_comments" ],
        [ "scoped with :limit",                       ".first_three" ],
        [ "scoped with :limit & :offset",             ".two_through_four" ],
        [ "scoped with :order",                       ".descending_id" ]
      ].each do |scope_type, scope|
        context "for #{base_type} #{scope_type}" do
          before(:each) do
            @articles = eval("#{base}#{scope}")
            @articles.all.should_not be_empty # sanity check: make sure our collection actually has some elements!
            @articles.all.should == @articles.all.uniq # don't want duplicate items in our test collection
          end
          instance_eval(&block)
        end
      end
    end
  end
end

Spec::Runner.configure do |config|
  config.extend Contexts
  config.include RoutingHelpers
  config.include ControllerHelpers
end
