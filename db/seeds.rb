require 'faker'

JoinTableGossipTag.destroy_all
Gossip.destroy_all
User.destroy_all
City.destroy_all
Tag.destroy_all



10.times do |index|
city1 = City.create!(name: Faker::Address.city, postal_code: Faker::Address.postcode)
user1 = User.create!(first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, age: rand(16..43), email: Faker::Internet.email, description: Faker::GreekPhilosophers.quote,city:city1)
user2 = User.create!(first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, age: rand(16..43), email: Faker::Internet.email, description: Faker::GreekPhilosophers.quote,city:city1)
gossip1 = Gossip.create!(title: Faker::Hipster.word, content: Faker::VForVendetta.quote,user:user1)
gossip2 = Gossip.create!(title: Faker::RickAndMorty.location, content: Faker::HowIMetYourMother.quote,user:user1)
tag1 = Tag.create!(title: Faker::Cannabis.strain)
gossip_tag1=JoinTableGossipTag.create!(gossip:gossip1,tag:tag1)
gossip_tag2=JoinTableGossipTag.create!(gossip:gossip2,tag:tag1)
pm=PrivateMessage.create!(content: Faker::ChuckNorris.fact,sender:user1,recipient:user2)
end
