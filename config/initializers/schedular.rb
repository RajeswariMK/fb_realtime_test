require 'rubygems'
require 'rufus/scheduler'

scheduler = Rufus::Scheduler.start_new

scheduler.every '1m' do
  puts 'check schedular'
  #Post.facebook_post
  sleep 120
  puts "after sleep"
end