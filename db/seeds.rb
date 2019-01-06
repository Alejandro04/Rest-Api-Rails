# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


# Create Default and first Superdmin User
User.create(
    username: "superadmin",
    email: "superadmin@superadmin.com",
    first_name: "Superadmin",
    last_name: "Super",
    password: "12345678",
    password_confirmation: "12345678")