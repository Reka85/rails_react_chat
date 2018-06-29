# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Message.destroy_all
User.destroy_all
Channel.destroy_all

user1 = User.create(email: "mici@catmail.com", password: "123456")
user2 = User.create(email: "tom@catmail.com", password: "234567")

channels = ["general", "react", "paris"]

channels.each do |channel|
  Channel.create(name: channel)
end

messages = ['hello general', "hello react", "hello paris"]


messages.each_with_index do |message, index|
  Message.create(content: message, channel: Channel.all[index], user: User.all.sample)
end
