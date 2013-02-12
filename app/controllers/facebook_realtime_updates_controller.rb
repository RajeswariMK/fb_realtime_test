class FacebookRealtimeUpdatesController < ApplicationController
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
end
