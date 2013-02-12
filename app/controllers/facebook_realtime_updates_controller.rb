class FacebookRealtimeUpdatesController < ApplicationController
  
  def notify
    if payload?
      # do something clever with the request body.
      respond_with 200
    else
      respond_with 400
    end
  end

  def verify
    challenge = Koala::Facebook::RealtimeUpdates.meet_challenge(params, 'stringToken')
    respond_to do |format|
      format.text do
        render text: challenge
      end
    end
  end
 
  def update
    # TODO: Handle an incoming POST from Facebook
    head :ok
  end
 
  def subscribe
    updates = Koala::Facebook::RealtimeUpdates.new(:app_id => '141213822708267', :secret => 'f9b95f55474f790335c44f4be592ec26')
    updates.subscribe("user", "likes", 'http://173.255.250.216:4567/fb_realtime_updates', 'stringToken')
    head :ok
  end

  private
 
  def body
    @body ||= request.body.read
  end
 
  def payload?
    /^sha1=(?<signature>[0-9a-z]{40})$/ =~ request.headers['HTTP_X_HUB_SIGNATURE']
    signature && digest(body) == signature
  end
 
  def respond_with(body = '', status)
    self.response_body = body
    self.status = status
  end
end
