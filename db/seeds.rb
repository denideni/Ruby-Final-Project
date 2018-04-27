# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database
# with its default values.
# The data can then be loaded with the rails db:seed command
# (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' },
# { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.destroy_all
Payment.destroy_all

bo = User.create!(id: 1,
                  first_name: 'Bo',
                  last_name: 'Trump',
                  email: 'bob3@penn.edu',
                  password: 'password')

alex = User.create!(id: 6,
                    first_name: 'Alex',
                    last_name: 'Gore',
                    email: 'Alex@penn.edu',
                    password: 'password')

bob = User.create!(id: 2,
                   first_name: 'Bob',
                   last_name: 'Bush',
                   email: 'bobo545@penn.edu',
                   password: 'password')

david = User.create!(id: 3,
                     first_name: 'David',
                     last_name: 'Obama',
                     email: 'oeuoeuu@penn.edu',
                     password: 'password')

signet = User.create!(id: 4,
                      first_name: 'Signet',
                      last_name: 'Washington',
                      email: 'lol@penn.edu',
                      password: 'password')

chris = User.create!(id: 5,
                     first_name: 'Christopher',
                     last_name: 'Jefferson',
                     email: 'chris@penn.edu',
                     password: 'password')

Payment.create(payer: bo,
               requester: alex,
               reason_for_payment: 'Drinks on Friday',
               payment_amount: 45.3)

Payment.create(payer: signet,
               requester: chris,
               reason_for_payment: 'Drinks on Tuesday',
               payment_amount: 45.3)

Payment.create(payer: bo,
               requester: chris,
               reason_for_payment: 'Drinks on Monday',
               payment_amount: 45.3)

Payment.create(payer: alex,
               requester: bo,
               reason_for_payment: 'Drinks on Sunday',
               payment_amount: 45.3)

Payment.create(payer: bob,
               requester: david,
               reason_for_payment: 'Food on Friday',
               payment_amount: 45.3)

Payment.create(payer: signet,
               requester: chris,
               reason_for_payment: 'Food on Friday',
               payment_amount: 45.3)

Payment.create(payer: chris,
               requester: signet,
               reason_for_payment: 'Food on Friday',
               payment_amount: 45.3)

Payment.create(payer: chris,
               requester: david,
               reason_for_payment: 'Food on Tuesday',
               payment_amount: 45.3)
