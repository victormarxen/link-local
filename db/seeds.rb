puts 'Cleaning database...'
Category.destroy_all

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
  puts "Created #{category.name}"
end
puts 'Finished!'
