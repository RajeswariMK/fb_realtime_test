require 'rubygems'
require 'rest-client'

class Post < ActiveRecord::Base
  attr_accessible :caption, :comments_count, :created_time, :description, :facebook_infos_id, :fb_post_id, :fb_updated_time, :likes_count, :link_url, :message, :name, :picture_url, :post_type, :source

  def self.facebook_post
  	page_token = ""
    current_user = User.first
    p current_user.oauth_token, "---current_user oauth_token"
  	@graph = Koala::Facebook::API.new(current_user.oauth_token)
  	p @graph, "---------koala graph"
  	page_access = @graph.get_connections('me', 'accounts')
  	p page_access, "------page_access_response"

  	page_access.each do |page|
  		if page["id"] == "194805460660388"
  			page_token = page["access_token"]
  		end
  	end
  	p page_token, "---------page_token"
  	# page_token = @graph.get_page_access_token("194805460660388")
  	@page_graph = Koala::Facebook::API.new(page_token)

	page_feed= @page_graph.get_connection('me', 'feed') # the page's wall
	p page_feed, "-----page_feed"
  	# result = @graph.batch do |batch_api|
   #  	batch_api.fql_query("q1:select name from user where uid=4","q2:")
   #  end
  	#@post = @graph.get_connections("me", "feed") 
  	p "executing method"  
    #p @post , "post"
  end 

end
	