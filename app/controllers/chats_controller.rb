class ChatsController < ApplicationController
  # GET /chats
  # GET /chats.json
  skip_before_filter :authenticate_user!
  def index
    request.subdomain
    @chats = Chat.all
    #render layout: false
  end

  # GET /chats/1
  # GET /chats/1.json
  def show
    @chat = Chat.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @chat }
    end
  end

  # GET /chats/new
  # GET /chats/new.json
  def new
    @chat = Chat.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @chat }
    end
  end

  # GET /chats/1/edit
  def edit
    @chat = Chat.find(params[:id])
  end

  # POST /chats
  # POST /chats.json
  def create
    Pusher.app_id = PUSHER_APP_ID
    Pusher.key = PUSHER_KEY
    Pusher.secret = PUSHER_SECRET
    @chat = Chat.create!(params[:chat])
    x = render_to_string(:partial => "chat", locals: {chat: @chat})
    Pusher["private-user-#{current_user.try(:id)}"].trigger("new-notification", x)
  end

  # PUT /chats/1
  # PUT /chats/1.json
  def update
    @chat = Chat.find(params[:id])

    respond_to do |format|
      if @chat.update_attributes(params[:chat])
        format.html { redirect_to @chat, notice: 'Chat was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @chat.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /chats/1
  # DELETE /chats/1.json
  def destroy
    @chat = Chat.find(params[:id])
    @chat.destroy

    respond_to do |format|
      format.html { redirect_to chats_url }
      format.json { head :no_content }
    end
  end
end
