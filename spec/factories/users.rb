FactoryGirl.define do 
	factory :user do
		sequence(:name) {|n| "Person #{n}"}
		sequence(:email) {|n| "Person_#{n}@example.com"}
		password "batman93"
		password_confirmation"batman93"

		factory :admin do
			admin true
		end
	end
end