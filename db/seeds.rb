require "open-uri"

puts 'Cleaning database...'
User.destroy_all
Category.destroy_all
Application.destroy_all
Country.destroy_all
Bookmark.destroy_all
Favourite.destroy_all

puts 'Creating categories...'

dating = { name: 'Dating', photo: 'app/assets/images/card2.jpeg' }
events = { name: 'Events', photo: 'app/assets/images/card1.jpeg' }
shops = { name: 'Shops', photo: 'app/assets/images/card8.jpeg' }
delivery = { name: 'Delivery', photo: 'app/assets/images/card5.jpeg' }
ride = { name: 'Ride', photo: 'app/assets/images/card4.jpeg' }
transport = { name: 'Transport', photo: 'app/assets/images/card12.jpeg' }
stay = { name: 'Stay', photo: 'app/assets/images/card13.jpeg' }
banking = { name: 'Banking', photo: 'app/assets/images/card14.jpeg' }

[dating, events, shops, delivery, ride, transport, stay, banking].each do |attributes|
  category = Category.new(name: attributes[:name])
  category_img = File.open(attributes[:photo], 'rb')
  category.photo.attach(io: category_img, filename: "#{attributes[:name]}_category.jpg", content_type: "image/jpg")
  category.save
  puts "Created #{category.name}!"
end

puts "creating users..."
alex_img = URI.open("https://res.cloudinary.com/victormarxen/image/upload/v1662563870/linklocal-apps/Headshot_eiiwzy.png")
alex = User.new(first_name: "Conor", last_name: "Kelly", email: 'conor@gmail.com', password: "123123")
alex.photo.attach(io: alex_img, filename: "alex_photo.jpg", content_type: "image/jpg")
alex.save
# = User.create(first_name: "Miguel", last_name: "Costelo", email: 'a@a.a', password: "123123")
puts "Users created!"

puts "Creating countries.."
portugal = Country.create(name: 'PT')
germany = Country.create(name: 'DE')
england = Country.create(name: 'GB')
puts "Countries created!"

puts "Creating applications.."
tinder = Application.new(
  name: "Tinder",
  description: "Tinder is probably the most popular dating app in Portugal. Unlike other dating apps where you search based on a number of specific filters (e.g. does the person want a relationship, do they have kids, how tall are they, etc), Tinder leaves the hard work up to you. All it does it show you one profile after another which you can swipe left or right on.

  However, Tinder isn't very good at helping you find the right person, but it is the most popular app which is why everyone continues to use it.",
  playstore: "https://play.google.com/store/apps/details?id=com.tinder&hl=en&gl=US"
)
tinder.category = Category.find_by(name: "Dating")
tinder_img = URI.open("https://logos-world.net/wp-content/uploads/2020/09/Tinder-Emblem.png")
tinder.photo.attach(io: tinder_img, filename: "tinder.png", content_type: "image/png")
tinder.save
puts "Created Tinder!"

badoo = Application.new(
  name: "Badoo",
  description: "Badoo is an app that many visitors to Portugal probably won't have heard of, but one that’s very popular in countries like Spain and Portugal. It follows a similar structure as Tinder by swiping left or right on profiles you like or don’t like. However there are additional features which make it easier to find profiles who’ve liked you.

  Given its local popularity, you'll likely need to speak some Portuguese if you want to chat with the people there.",
  playstore: "https://play.google.com/store/apps/details?id=com.badoo.mobile&hl=en_IE&gl=US"
)
badoo_img = URI.open("https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSf-yxBbN6MztVz1vm2jzyVesv_rXIN8pUzcCt7PhFDjtH7LEC3jp_OhxiHGfCuXr18mKE&usqp=CAU")
badoo.photo.attach(io: badoo_img, filename: "badoo.png", content_type: "image/png")
badoo.category = Category.find_by(name: "Dating")
badoo.save
puts "Created Badoo!"

bumble = Application.new(
  name: "Bumble",
  description: "With Bumble, if you match with someone, it’s up to the woman to start the conversation. And, they have to do it within a 24-hour window as well.

  It isn’t that different to Tinder in reality. Bumble does ask a few more questions like do you prefer Netflix or Nightclubs, but it doesn’t really encourage people to fill out their profiles in any more depth than Tinder does.",
  playstore: "https://play.google.com/store/apps/details?id=com.bumble.app&hl=en&gl=US"
)
bumble_img = URI.open("https://res.cloudinary.com/victormarxen/image/upload/v1662566614/linklocal-apps/bumble_teuvpe.png")
bumble.photo.attach(io: bumble_img, filename: "bumble.png", content_type: "image/png")
bumble.category = Category.find_by(name: "Dating")
bumble.save
puts "Created Bumble!"

hinge = Application.new(
  name: "Hinge",
  description: "Hinge is a dating app that’s focused on getting people to connect, and actually described itself as “The dating app designed to be deleted”. Rather than simply swiping yes to someone, you have to comment on an aspect of their profile.

  It has recently rolled out in Portugal and is becoming a common choice for young working professionals.",

  playstore: "https://play.google.com/store/search?q=hinge&c=apps&hl=en&gl=US"
)
hinge_img = URI.open("https://res.cloudinary.com/victormarxen/image/upload/v1662566642/linklocal-apps/hinge_r4wmzi.png")
hinge.photo.attach(io: hinge_img, filename: "hinge.png", content_type: "image/png")
hinge.category = Category.find_by(name: "Dating")
hinge.save
puts "Created Hinge!"

pof = Application.new(
  name: "Plenty of Fish",
  description: "POF is one of the largest free dating websites in the world, and very popular because it’s free. It attracts people of all ages, particularly a slightly older age group.

  The profiles on POF tend to vary in quality. Not a lot of people put effort into their profiles and, unlike sites like OkCupid, they aren’t really encouraged to do so. This means that you don’t really get to know a lot about people before you message them, and so most of your decisions will be based on looks.",

  playstore: "https://play.google.com/store/apps/details?id=com.pof.android&hl=en&gl=US"
)
pof_img = URI.open("https://res.cloudinary.com/victormarxen/image/upload/v1662630498/linklocal-apps/pof_blue_aqydwy.png")
pof.photo.attach(io: pof_img, filename: "pof_blue.png", content_type: "image/png")
pof.category = Category.find_by(name: "Dating")
pof.save
puts "Created Plenty of Fish!"

freenow = Application.new(
  name: "Free Now",
  description: "One of the best taxi apps in Germany is Free Now. This app offers an easy way to book and share a taxi as well as rent a car in Berlin, Munich and other major cities in the country. The app is pretty user-friendly, making it easy to find your nearest taxi and track its arrival.
  Free Now also offers e-scooters and car sharing in major German cities.",
  playstore: "https://play.google.com/store/apps/details?id=taxi.android.client&hl=en&gl=US"
)
freenow_img = URI.open("https://play-lh.googleusercontent.com/ORYw207974qu7SR5ewi8T8ZcGhEkOPiqN8lP-UoLNjQWUje1DvWtIojmPtZxmKbUQcI")
freenow.photo.attach(io: freenow_img, filename: "freenow.png", content_type: "image/png")
freenow.category = Category.find_by(name: "Ride")
freenow.save
puts "Created Free Now!"

uber = Application.new(
  name: "Uber",
  description: "Uber is one of the best taxi apps in Germany for several reasons. First, it's extremely affordable and can be a great way to save money on your rides. Additionally, Uber offers a rewards program that lets you earn points for every ride and Uber Eats.",
  playstore: "https://play.google.com/store/apps/details?id=com.ubercab&hl=en&gl=US"
)
uber_img = URI.open("https://logodownload.org/wp-content/uploads/2015/05/uber-logo-5-1.png")
uber.photo.attach(io: uber_img, filename: "uber.png", content_type: "image/png")
uber.category = Category.find_by(name: "Ride")
uber.save
puts "Created Uber!"

bolt = Application.new(
  name: "Bolt",
  description: "Bolt is a new riser across Europe in the public mobility space. They strive to offer competitive fares for Taxis and have become a popular choice for many users as a result.

  Similar to most taxi apps, you simply create an account, add payment details and you’re good to go. It is a European equivalent to Uber.

  Bolt also has bikes and e-scooters in many major European cities.",

  playstore: "https://play.google.com/store/apps/details?id=ee.mtakso.client&hl=en&gl=US"
)
bolt_img = URI.open("https://res.cloudinary.com/victormarxen/image/upload/v1662568887/linklocal-apps/bolt_oyafsg.png")
bolt.photo.attach(io: bolt_img, filename: "bolt.png", content_type: "image/png")
bolt.category = Category.find_by(name: "Ride")
bolt.save
puts "Created Bolt!"

taxieu = Application.new(
  name: "Taxi.eu",
  description: "Taxi.eu app is a great choice for travellers in Germany. This app allows you to book a taxi in any city in Europe, making it the perfect choice for those who are visiting multiple countries.

  If you’re looking to move around quickly however, Bolt, Uber or FreeNow may be a better choice.",

  playstore: "https://play.google.com/store/apps/details?id=at.austrosoft.t4me.MB_BerlinTZBEU&hl=en_US&gl=US"
)
taxieu_img = URI.open("https://res.cloudinary.com/victormarxen/image/upload/v1662568902/linklocal-apps/taxieu_hzc7rr.png")
taxieu.photo.attach(io: taxieu_img, filename: "taxieu.png", content_type: "image/png")
taxieu.category = Category.find_by(name: "Ride")
taxieu.save
puts "Created Taxi.eu!"

rightmove = Application.new(
  name: "Rightmove",
  description: "Hailed as the most popular property portal in the UK, Rightmove offers a number of necessities for both agents and regular consumers looking to buy, sell, or rent a property. Everyone in the UK knows of this platform with brand awareness through the roof.
  It is free to download and offers smart features such as personalise search, valuation tech and open house calendar.",
  playstore: "https://play.google.com/store/apps/details?id=com.rightmove.android&hl=en&gl=US"
)
rightmove_img = URI.open("https://res.cloudinary.com/victormarxen/image/upload/v1662563277/linklocal-apps/rightmove_ztfavc.png")
rightmove.photo.attach(io: rightmove_img, filename: "rightmove.png", content_type: "image/png")
rightmove.category = Category.find_by(name: "Stay")
rightmove.save
puts "Created Rightmove!"

zoopla = Application.new(
  name: "Zoopla",
  description: "Zoopla touts itself as having more real estate data than “anywhere else,” and as being the most reliable way to hunt for a home.

  With a section for market news and insights, valuation technology, and over a million listings, Zoopla arms its users with enough information to allow for confident decision-making when it comes to all things real estate.",
  playstore: "https://play.google.com/store/apps/details?id=com.zoopla.activity&hl=en_IE&gl=US"
)
zoopla_img = URI.open("https://res.cloudinary.com/victormarxen/image/upload/v1662564732/linklocal-apps/zoopla_fdgrk9.png")
zoopla.photo.attach(io: zoopla_img, filename: "zoopla.png", content_type: "image/png")
zoopla.category = Category.find_by(name: "Stay")
zoopla.save
puts "Created Zoopla!"

onthemarket = Application.new(
  name: "OnTheMarket",
  description: "OnTheMarket claims to receive listings a full day before competitors Rightmove and Zoopla. When it comes to viewing a listing, OTM listings have detailed information that can be viewed before a prospective buyer decides to visit the property, including see what kinds of amenities are close to a listing, including schools, public transportation, and more.",
  playstore: "https://play.google.com/store/apps/details?id=com.onthemarket.mobile&hl=en&gl=US"
)
onthemarket_img = URI.open("https://res.cloudinary.com/victormarxen/image/upload/v1662565339/linklocal-apps/onthemarket_ggevxy.png")
onthemarket.photo.attach(io: onthemarket_img, filename: "onthemarket.png", content_type: "image/png")
onthemarket.category = Category.find_by(name: "Stay")
onthemarket.save
puts "Created OnTheMarket!"

spotahome = Application.new(
  name: "Spotahome",
  description: "Spotahome is the first platform designed for direct booking of accommodation of 30 days or more, taking away one of the biggest headaches for people planning to move abroad. It makes finding a new home secure, transparent, fast and easy.

  Spotahome personally checks properties and neighbourhoods of listings, guaranteeing the property will be as described in the listing. They also provide compensation for a hotel & relocation should your landlord cancel your booking.",
  playstore: "https://play.google.com/store/apps/details?id=com.spotahome.tnnt&hl=en&gl=US"
)
spotahome_img = URI.open("https://res.cloudinary.com/victormarxen/image/upload/v1662565869/linklocal-apps/spotahome_cb8gvq.png")
spotahome.photo.attach(io: spotahome_img, filename: "spotahome.png", content_type: "image/png")
spotahome.category = Category.find_by(name: "Stay")
spotahome.save
puts "Created Spotahome!"

airbnb = Application.new(
  name: "Airbnb",
  description: "Airbnb is very popular in the UK for short to medium term rentals. In some UK cities 1 in 4 properties are available on Airbnb.

  The globally renowned app allows home owners to let out their properties for a couple days to a few months to anyone on  the site.

  Airbnb would be the top choice for anyone who needs a place to stay for any time under 3 months.",
  playstore: "https://play.google.com/store/apps/details?id=com.airbnb.android&hl=en&gl=US",
  appstore: "https://apps.apple.com/us/app/airbnb/id401626263"
)
airbnb_img = URI.open("https://res.cloudinary.com/victormarxen/image/upload/v1662629479/linklocal-apps/airbnb_j8nnsl.png")
airbnb.photo.attach(io: airbnb_img, filename: "airbnb.png", content_type: "image/png")
airbnb.category = Category.find_by(name: "Stay")
airbnb.save
puts "Created Airbnb!"

puts "Associating country with applications.."
Bookmark.create(country: portugal, application: tinder)
Bookmark.create(country: portugal, application: badoo)
Bookmark.create(country: portugal, application: bumble)
Bookmark.create(country: portugal, application: hinge)
Bookmark.create(country: portugal, application: pof)
Bookmark.create(country: germany, application: uber)
Bookmark.create(country: germany, application: bolt)
Bookmark.create(country: germany, application: freenow)
Bookmark.create(country: germany, application: taxieu)
Bookmark.create(country: england, application: rightmove)
Bookmark.create(country: england, application: zoopla)
Bookmark.create(country: england, application: airbnb)
Bookmark.create(country: england, application: onthemarket)
Bookmark.create(country: england, application: spotahome)
puts "Associations done!"
