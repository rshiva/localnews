FactoryGirl.define do 
	factory :user do	
		password  "foobar"
		sequence(:email) { |n| "foo#{}@example.com"}
	end

	

	factory :post do
		title "Test title"
		content "This should have a text"
		user
	end

end


