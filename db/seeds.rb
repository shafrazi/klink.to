# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

product_links = ["/static/images/assets/products/watch.jpg", "/static/images/assets/products/shoes.jpg", "/static/images/assets/products/jacket.jpg", "/static/images/assets/products/bag.jpg"]

users = User.create([{email: "foo@bar.com", password: "foobar", first_name: "shafrazi", last_name: "shiffa"}, {email: "foo1@bar.com", password: "foobar", first_name: "shafrazi", last_name: "shiffa"}, {email: "foo2@bar.com", password: "foobar", first_name: "shafrazi", last_name: "shiffa"}, {email: "foo3@bar.com", password: "foobar", first_name: "shafrazi", last_name: "shiffa"}])

50.times do |i|
  page = users.sample.product_pages.create(title: "Product page #{i}", description: "test description")
  4.times do |j|
    page.link_items.create(user_id: page.user_id, title: "Test title", description: "test description", image: product_links.sample, price: "14.99", source: "http://amazon.com")
  end
end