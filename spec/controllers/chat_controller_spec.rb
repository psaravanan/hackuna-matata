require 'spec_helper'

describe ChatsController do

	it "responds successfully with an HTTP 200 status code" do
	  get :index
	  expect(response).to be_success
	  expect(response.status).to eq(200)
	end

	it "renders the index template" do
	  get :index
	  expect(response).to render_template("index")
	end

	it "loads all of the posts into @posts" do
	  post1, post2 = Chat.create!(message: "test message 5"), Chat.create!(message: "test message 6")
	  get :index

	  expect(assigns(:chats)).to match_array([post1, post2])
	end

end
