require 'rest-client'

class Post < ActiveRecord::Base
  attr_accessible :caption, :comments_count, :created_time, :description, :facebook_infos_id, :fb_post_id, :fb_updated_time, :likes_count, :link_url, :message, :name, :picture_url, :post_type, :source

  def self.facebook_post
  	p "executing method"  	
  end 
end
