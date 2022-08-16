require "faker"
User.create!(name: "Mai Hoang Minh",
            email: "maihoangminhbk@gmail.com",
            password: "123456",
            password_confirmation: "123456",
            admin: true,
            activated: true,
            activated_at: Time.zone.now)

for n in 0..99
  name = Faker::Name.name
  email = "example-#{n+1}@railstutorial.org"
  password = "password"
  User.create!(name: name,
              email: email,
              password: password,
              password_confirmation: password,
              activated: true,
              activated_at: Time.zone.now)
end
