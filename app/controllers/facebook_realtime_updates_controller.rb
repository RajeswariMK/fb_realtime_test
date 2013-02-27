require 'json'
require 'time'
class FacebookRealtimeUpdatesController < ApplicationController
  def realtime_request?(request)
    ((request.method == "GET" && params['hub.mode'].present?) ||
       (request.method == "POST"))
  end

  def subscription
    if request.method == "GET"
      challenge = Koala::Facebook::RealtimeUpdates.meet_challenge(params,'stringToken')
        if(challenge)
          render :text => challenge
        else
          render :text => 'Failed to authorize facebook challenge request'
        end
    elsif request.method == "POST"
      @updated_obj = JSON.parse(request.body.read)
      p @updated_obj, "--------------response from FB"
      facebook_like = FacebookLikes.new
      @updated_obj["entry"].each do |entry|
                                       
            # facebook_like.uid = entry["uid"]
            facebook_like.facebook_id = entry["id"]
            facebook_like.time = entry["time"]
            change_field = entry["changes"]
            if change_field[0]["value"]["item"] == "post"
              facebook_like.changed_fields = change_field[0]["value"]["post_id"]
            end  
            facebook_like.save
      end
      p facebook_like, "------------------------------------------"
      render :text => "Thanks for the update"
    end
  end

  def updates
    @updates = FacebookLikes.order("time desc").all

  end
end

                              