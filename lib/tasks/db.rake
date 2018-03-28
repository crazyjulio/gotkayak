namespace :db do
  desc 'Create some users'
  task create_users: :environment do
    User.create!(email: 'lylesjt@gmail.com', password: 'jason', password_confirmation: 'jason', name: 'Jason Lyles')
    User.create!(email: 'lylesbk@yahoo.com', password: 'brian', password_confirmation: 'brian', name: 'Brian Lyles')
    User.create!(email: 'tom@gotkayak.com', password: 'tom', password_confirmation: 'tom', name: 'Tom Lyles')
    User.create!(email: 'ncwplanner@gmail.com', password: 'neil', password_confirmation: 'neil', name: 'Neil Wert')
    User.create!(email: 'everett.simpson@gmail.com', password: 'everett', password_confirmation: 'everett', name: 'Everett Simpson')
    User.create!(email: 'kingpn626@gmail.com', password: 'paul', password_confirmation: 'paul', name: 'Paul King')
    User.create!(email: 'ojibwayd@icloud.com', password: 'danny', password_confirmation: 'danny', name: 'Danny Ojibway')
  end

  desc 'Drop, migrate, re-seed'
  task rebuild: :environment do
    puts 'Dropping the db'
    system('rake db:drop')
    puts 'Migrating anew'
    system('rake db:migrate')
    puts 'Re-seeding the data'
    system('rake db:seed')
  end
end
