# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.destroy_all
Artwork.destroy_all
ArtworkShare.destroy_all

u1 = User.create(username: 'Bobby')
u2 = User.create(username: 'Sterling Archer')
u3 = User.create(username: 'Bojack Horseman')
u4 = User.create(username: 'Bobby Burger')
u5 = User.create(username: 'Larry')
u6 = User.create(username: 'Dino')

aw1 = Artwork.create(title: 'Bob', image_url: 'pic.com', artist_id: u1.id)
aw2 = Artwork.create(title: 'Rob', image_url: 'pic.com', artist_id: u1.id)
aw3 = Artwork.create(title: 'Lob', image_url: 'pic.com', artist_id: u2.id)
aw4 = Artwork.create(title: 'Cob', image_url: 'pic.com', artist_id: u3.id)
aw5 = Artwork.create(title: 'Sob', image_url: 'pic.com', artist_id: u4.id)
aw6 = Artwork.create(title: 'Fob', image_url: 'pic.com', artist_id: u5.id)

as1 = ArtworkShare.create(artwork_id: aw1.id, viewer_id: u1.id)
as2 = ArtworkShare.create(artwork_id: aw1.id, viewer_id: u2.id)
as3 = ArtworkShare.create(artwork_id: aw1.id, viewer_id: u3.id)
as4 = ArtworkShare.create(artwork_id: aw3.id, viewer_id: u4.id)
as5 = ArtworkShare.create(artwork_id: aw3.id, viewer_id: u5.id)
as6 = ArtworkShare.create(artwork_id: aw5.id, viewer_id: u6.id)