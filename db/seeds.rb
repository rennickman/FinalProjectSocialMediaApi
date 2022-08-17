# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)



# Create Doorkeeper applications for various types of clients - if none already exist in database
if Doorkeeper::Application.count.zero?
    Doorkeeper::Application.create!(name: "React", redirect_uri: " ", scopes: "")
end



# Make sure an admin User is created in the database - If one doesn't exist create seed one into database
User.first_or_create(
    email: 'renn@example.com',
    password: 'password',
    password_confirmation: 'password',
    firstname: "Ian",
    surname: "Rennick",
    role: User.roles[:admin],
    status: "Finishing project",
    currentCity: "Newbridge",
    loves: "Football, music, sports",
    hates: "Vegetables and raggaeton",
    desc: "Hey, I'm really into computers and bikes"
)



# Adding test users
User.create(
    email: 'test@example.com',
    password: 'password',
    password_confirmation: 'password',
    firstname: "Test",
    surname: "Testerson",
    role: User.roles[:user],
    status: "Testing stuff",
    originalCity: "Newbridge",
    currentCity: "Dublin",
    loves: "Testing, fixing things",
    hates: "When things don't work",
    desc: "I am not a real person"
)

User.create(
    email: 'bob@example.com',
    password: 'password',
    password_confirmation: 'password',
    firstname: "Bob",
    surname: "Robertson",
    role: User.roles[:user],
    status: "Bobbing it",
    originalCity: "Newbridge",
    currentCity: "Dublin",
    loves: "Comic books and movies",
    hates: "The beach and getting sub burnt",
    desc: "Hey, I'm really into computers and bikes"
)

User.create(
    email: 'Tim@example.com',
    password: 'password',
    password_confirmation: 'password',
    firstname: "Tim",
    surname: "Tompson",
    role: User.roles[:user],
    status: "Tim Lad!!!",
    originalCity: "Newbridge",
    currentCity: "Dublin",
    loves: "Long walks by the sea",
    hates: "Cheese and chocolate",
    desc: "Hey, I'm really into computers and bikes"
)

User.create(
    email: 'mick@example.com',
    password: 'password',
    password_confirmation: 'password',
    firstname: "Mick",
    surname: "Mackerson",
    role: User.roles[:user],
    status: "Mickying about",
    originalCity: "Newbridge",
    currentCity: "Dublin",
    loves: "Basketball and camping",
    hates: "Morning time and cold showers",
    desc: "Hey, I'm really into computers and bikes"
)

User.create(
    email: 'sam@example.com',
    password: 'password',
    password_confirmation: 'password',
    firstname: "Sam",
    surname: "Sampson",
    role: User.roles[:user],
    status: "Sammin it about",
    originalCity: "Newbridge",
    currentCity: "Dublin",
    loves: "Sun and sand",
    hates: "Rain and snow",
    desc: "Hey, I'm really into computers and bikes"
)

