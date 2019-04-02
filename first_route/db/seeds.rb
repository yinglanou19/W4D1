# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


users =[]
10.times do
    users << User.create({username: Faker::Internet.unique.email})
end

artworks = []
10.times do
    artworks << Artwork.create({title:Faker::FunnyName.unique.name, image_url:"google.com", artist_id: rand(1..10)})
end

artworks.each do |a|
    ArtworkShare.create({artwork_id: a.id, viewer_id: users.sample.id})
end

