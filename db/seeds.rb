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
    role: User.roles[:admin]
)



