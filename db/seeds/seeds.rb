# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).

User.create!(first_name:            "Example",
             last_name:             "Fake",
             gender:                "male",
             date_of_birth:         "BIRTHDAY",
             street_name:           "Fake St.",
             street_number:         "1",
             state:                 "Fake State",
             suit_number:           "04",
             mailing_address:       "fake-address",
             email_address:         "example@test-email.ca",
             password:              "foobar",
             password_confirmation: "foobar",
             role:                  "customer",
             created_at: Time.zone.now,
             activated: true,
             activated_at: Time.zone.now
             )


99.times do | n |
  first_name  = Faker::Name.unique.first_name
  last_name  = Faker::Name.unique.last_name
  email_address = "example-#{n+1}@fakeemail.com"
  password = "password"
  suit_number = Faker::Number.suit_number(2)
  User.create!(first_name: firstname,
              last_name: lastname,
              gender: gender,
              date_of_birth: birthday,
              street_name: streetname,
              state: state,
              suit_number: suitnumber,
              mailing_address: mailingaddress,
              email_address: email_address,
              password: password,
              password_confirmation: password,
              role: role,
              created_at: Time.zone.now,
              activated: true,
              activated_at: Time.zone.now
              )
            end
