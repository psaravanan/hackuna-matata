class PusherController < ApplicationController
  protect_from_forgery :except => :auth # stop rails CSRF protection for this action

  def auth
    Pusher.app_id = PUSHER_APP_ID
    Pusher.key = PUSHER_KEY
    Pusher.secret = PUSHER_SECRET
    if current_user && params[:channel_name] == "private-user-#{current_user.id}"
      response = Pusher[params[:channel_name]].authenticate(params[:socket_id])
      render :json => response
    else
      render :text => "Not authorized", :status => '403'
    end
  end
end