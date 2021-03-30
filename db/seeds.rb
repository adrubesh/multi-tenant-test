# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
#

10.times do
  User.create(name: Faker::Name.name)
end

30.times do
  ids = User.pluck(:id)
  Post.create(title: Faker::Books::Lovecraft.tome, body: Faker::Books::Lovecraft.paragraph, tenant_id: ids.sample)
end

Post.all.each do |p|
  Comment.create(body: Faker::Books::Dune.quote, post_id: p.id, tenant_id: p.tenant_id)
end
