require "open-uri"

puts 'Cleaning database...'
User.destroy_all
Category.destroy_all
Application.destroy_all
Country.destroy_all
Bookmark.destroy_all
Favourite.destroy_all

puts 'Creating categories...'
dating = { name: 'Dating', icon: '❤️' }
events =  { name: 'Events', icon: '🕺' }
marketplaces = { name: 'Marketplaces', icon: '🤝' }
delivery =  { name: 'Delivery', icon: '🍕' }
ride = { name: 'Ride', icon: '🚕' }
transport = { name: 'Transport', icon: '🚆' }
flats = { name: 'Flats', icon: '🏠' }
accomodation = { name: 'Accomodation', icon: '🛌' }
banking = { name: 'Banking', icon: '💳' }

[dating, events, marketplaces, delivery, ride, transport, flats, accomodation, banking].each do |attributes|
  category = Category.create!(attributes)
  puts "Created #{category.name}!"
end


puts "creating users..."
alex = User.create(email: 'alex@gmail.com', password: "123123")
a = User.create(email: 'a@a.a', password: "123123")
puts "Users created!"

puts "Creating countries.."
portugal = Country.create(name: 'PT')
germany = Country.create(name: 'DE')
puts "Countries created!"

puts "Creating applications.."
tinder = Application.new(
  name: "Tinder",
  description: "Tinder is probably the most popular dating app in Portugal. Unlike other dating apps where you search based on a number of specific filters (e.g. does the person want a relationship, do they have kids, how tall are they, etc), Tinder leaves the hard work up to you. All it does it show you one profile after another which you can swipe left or right on.

  However, Tinder isn’t very good at helping you find the right person, but it is the most popular app which is why everyone continues to use it.",
  playstore: ""
)
tinder.category = Category.find_by(name: "Dating")
tinder_img = URI.open("https://logos-world.net/wp-content/uploads/2020/09/Tinder-Emblem.png")
tinder.photo.attach(io: tinder_img, filename: "tinder.png", content_type: "image/png")
tinder.save
puts "Created Tinder!"

badoo = Application.new(
  name: "Badoo",
  description: "Badoo is an app that many visitors to Portugal probably won’t have heard of, but one that’s very popular in countries like Spain and Portugal. It follows a similar structure as Tinder by swiping left or right on profiles you like or don’t like. However there are additional features which make it easier to find profiles who’ve liked you.

  Given its local popularity, you’ll likely need to speak some Portuguese if you want to chat with the people there.",
  playstore: "https://apps.apple.com/us/app/badoo-dating-chat-friends/id351331194"
)
badoo_img = URI.open("https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSf-yxBbN6MztVz1vm2jzyVesv_rXIN8pUzcCt7PhFDjtH7LEC3jp_OhxiHGfCuXr18mKE&usqp=CAU")
badoo.photo.attach(io: badoo_img, filename: "badoo.png", content_type: "image/png")
badoo.category = Category.find_by(name: "Dating")
badoo.save
puts "Created Badoo!"

freenow = Application.new(
  name: "Free Now",
  description: "One of the best taxi apps in Germany is Free Now. This app offers an easy way to book and share a taxi as well as rent a car in Berlin, Munich and other major cities in the country. The app is pretty user-friendly, making it easy to find your nearest taxi and track its arrival.
  Free Now also offers e-scooters and car sharing in major German cities.",
  playstore: "https://apps.apple.com/us/app/free-now-mytaxi/id357852748"
)
freenow_img = URI.open("https://play-lh.googleusercontent.com/ORYw207974qu7SR5ewi8T8ZcGhEkOPiqN8lP-UoLNjQWUje1DvWtIojmPtZxmKbUQcI")
freenow.photo.attach(io: freenow_img, filename: "freenow.png", content_type: "image/png")
freenow.category = Category.find_by(name: "Ride")
freenow.save
puts "Created Free Now!"

uber = Application.new(
  name: "Uber",
  description: "Uber is one of the best taxi apps in Germany for several reasons. First, it's extremely affordable and can be a great way to save money on your rides. Additionally, Uber offers a rewards program that lets you earn points for every ride and Uber Eats.",
  playstore: "https://apps.apple.com/us/app/free-now-mytaxi/id357852748"
)
uber_img = URI.open("https://logodownload.org/wp-content/uploads/2015/05/uber-logo-5-1.png")
uber.photo.attach(io: uber_img, filename: "uber.png", content_type: "image/png")
uber.category = Category.find_by(name: "Ride")
uber.save
puts "Created Uber!"

puts "Associating country with applications.."
Bookmark.create(country: portugal, application: tinder)
Bookmark.create(country: portugal, application: badoo)
Bookmark.create(country: germany, application: freenow)
Bookmark.create(country: germany, application: uber)
puts "Associations done!"
