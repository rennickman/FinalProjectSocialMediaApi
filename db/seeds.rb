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
    originalCity: "Newbridge",
    currentCity: "Dublin",
    loves: "Wigan",
    hates: "This project",
    desc: "Bla bla bla di bla"
)



# Adding test users
User.create(
    email: 'test@example.com',
    password: 'password',
    password_confirmation: 'password',
    firstname: "Test",
    surname: "Testerson",
    role: User.roles[:user],
    status: "Testing shit",
    originalCity: "Newbridge",
    currentCity: "Dublin",
    loves: "Testing",
    hates: "Not testing",
    desc: "Testing all day bai"
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
    loves: "Bobbing for apples",
    hates: "Bobcats",
    desc: "Story hai"
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
    loves: "Timmin and thawing",
    hates: "Cheese",
    desc: "Craic lad?"
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
    loves: "Mickys",
    hates: "Starburst",
    desc: "Hip to da hop"
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
    desc: "Sam the man"
)

