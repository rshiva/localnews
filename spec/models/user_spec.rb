require "spec_helper"

describe User do 
	it "create new valid post" do 
		post=build(:post,title: "test",content: "should have a content")
		post=post.user
		post.save!

	end

end