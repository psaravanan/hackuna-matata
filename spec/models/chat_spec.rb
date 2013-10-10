require 'spec_helper'

describe Chat do
  #pending "add some examples to (or delete) #{__FILE__}"


  it "has none to begin with" do
    expect(Chat.count).to eq 0
  end

  it "has one after adding one" do
    Chat.create(message: "Test message 3")
    expect(Chat.count).to eq 1
  end

  it "has none after one was created in a previous example" do
    expect(Chat.count).to eq 0
  end

  it "has no widgets in the database" do
    expect(Chat).to have(:no).records
    expect(Chat).to have(0).records
  end

  it "has one record" do
    Chat.create!(:message => "Test messsage")
    expect(Chat).to have(1).record
  end

  it "counts only records that match a query" do
    Chat.create!(:message => "Test messsage 2")
    expect(Chat.where(:message => "Test messsage 2")).to have(1).record
    expect(Chat.where(:message => "Test messsage")).to have(0).records
  end


  context "2 record on chat table" do
    it "checking equality" do
      chat1 = Chat.create!(message: "First Chat")
      chat2 = Chat.create!(message: "Second Chat")
      expect(chat1).to eq(chat1)
    end
  end

	#it "fails validation with no message (using error_on)" do
	#	expect(Chat.new).to have(1).errors_on(:message)
	#end

  it "fails validation with no message expecting a specific message" do
  	pending
    expect(Chat.new.errors_on(:message)).to include("can't be blank....")
  end


  it "passes validation with a longer message" do
    expect(Chat.new(:message => "a longer name")).
      to have(0).errors_on(:message)
  end

end
