namespace :db do 
	desc "fill database with sample data"
	task populate: :environment do
		User.create!(name: "Example User", email:"exame@example.org", password: "00000000", password_confirmation: "00000000")
		admin.toggle!(:admin)
		99.times do |n|
			name = Faker::Name.name
			email = "example-#{n+1}@example.com"
			password = "password"
			User.create!(name: name, email: email, password: password, password_confirmation: password)
		end	
	end
end