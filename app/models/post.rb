require 'rubygems'
require 'rest-client'

class Post < ActiveRecord::Base
  attr_accessible :caption, :comments_count, :created_time, :description, :facebook_infos_id, :fb_post_id, :fb_updated_time, :likes_count, :link_url, :message, :name, :picture_url, :post_type, :source

  def self.facebook_post
  	current_user ||= User.first
  	@graph = Koala::Facebook::API.new(current_user.oauth_token)
  	@post = @graph.get_connections("me", "feed") 
  	p "executing method"  
   p @post , "post"
  end 

end
	