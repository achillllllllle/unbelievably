puts "Deleting all users"
User.destroy_all
puts "Done!"
puts "Deleting all reservations"
Reservation.destroy_all
puts "Done!"
puts "Deleting all wonders"
Wonder.destroy_all
puts "Done!"

# Fake User

puts "Creating user"
user1 = User.create(username: "Jean_Dupont", phone: "06 12 34 56 78", birth_date: "1990-05-15", email: "john.doe@example.com", password: "encryptedpassword123", reset_password_token: nil, reset_password_sent_at: nil, remember_created_at: nil)
puts "Creating user"
user2 = User.create(username: "Marie_Leroy", phone: "07 23 45 67 89", birth_date: "1985-09-28", email: "jane.smith@example.com", password: "encryptedsecurePassword!", reset_password_token: nil, reset_password_sent_at: nil, remember_created_at: nil)
puts "Creating user"
user3 = User.create(username: "Antoine_Petit", phone: "06 98 76 54 32", birth_date: "1988-12-03", email: "alex.taylor@example.com", password: "encryptedpassword456", reset_password_token: nil, reset_password_sent_at: nil, remember_created_at: nil)
puts "Creating user"
user4 = User.create(username: "Sophie_Martin", phone: "07 34 56 78 90", birth_date: "1993-07-19", email: "sam.jordan@example.com", password: "encryptedsecurePassword789", reset_password_token: nil, reset_password_sent_at: nil, remember_created_at: nil)
puts "Creating user"
user5 = User.create(username: "Pierre_Lefevre", phone: "06 45 67 89 01", birth_date: "1982-02-10", email: "casey.reed@example.com", password: "encryptedpassword101112", reset_password_token: nil, reset_password_sent_at: nil, remember_created_at: nil)
puts "Creating user"
user6 = User.create(username: "Camille_Roux", phone: "07 56 78 90 12", birth_date: "1995-11-25", email: "morgan.lee@example.com", password: "encryptedsecurePassword131415", reset_password_token: nil, reset_password_sent_at: nil, remember_created_at: nil)
puts "Creating user"
user7 = User.create(username: "Lucie_Garcia", phone: "06 78 90 12 34", birth_date: "1997-04-07", email: "jamie.parker@example.com", password: "encryptedpassword161718", reset_password_token: nil, reset_password_sent_at: nil, remember_created_at: nil)
puts "Done!"

# Fake wonders

puts "Creating wonder"
wonder1 = Wonder.create(title: "Great Wall of China", price_per_day: 150, category: "Historic", location: "China", content: "Ancient series of walls and fortifications.", user_id: user1.id )
puts "Creating wonder"
wonder2 = Wonder.create(title: "Eiffel Tower", price_per_day: 100, category: "Landmark", location: "Paris", content: "Iconic French landmark.", user_id: user2.id)
puts "Creating wonder"
wonder3 = Wonder.create(title: "Statue of Liberty", price_per_day: 200, category: "Monument", location: "New York", content: "A colossal neoclassical sculpture on Liberty Island.", user_id: user3.id)
puts "Creating wonder"
wonder4 = Wonder.create(title: "Colosseum", price_per_day: 150, category: "Historic", location: "Rome", content: "An oval amphitheatre in the centre of the city of Rome.", user_id: user4.id)
puts "Creating wonder"
wonder5 = Wonder.create(title: "Machu Picchu", price_per_day: 300, category: "Ancient", location: "Peru", content: "An Incan citadel set high in the Andes Mountains.", user_id: user5.id)
puts "Creating wonder"
wonder6 = Wonder.create(title: "Taj Mahal", price_per_day: 250, category: "Monument", location: "India", content: "An ivory-white marble mausoleum on the south bank of the Yamuna river.", user_id: user6.id)
puts "Creating wonder"
wonder7 = Wonder.create(title: "Great Barrier Reef", price_per_day: 350, category: "Natural", location: "Australia", content: "The world's largest coral reef system.", user_id: user7.id)
puts "Done!"

# Fake reservation

puts "Creating reservation"
Reservation.create(start_date: "2024-03-01", end_date: "2024-03-05", price: 500, user_id: user1.id, wonder_id: wonder1.id, accepted: true)
puts "Creating reservation"
Reservation.create(start_date: Date.new(2024, 4, 10), end_date: Date.new(2024, 4, 15), price: 750, user_id: user2.id, wonder_id: wonder2.id, accepted: true)
puts "Creating reservation"
Reservation.create(start_date: Date.new(2024, 5, 10), end_date: Date.new(2024, 5, 15), price: 1000, user_id: user3.id, wonder_id: wonder3.id, accepted: true)
puts "Creating reservation"
Reservation.create(start_date: Date.new(2024, 6, 20), end_date: Date.new(2024, 6, 25), price: 750, user_id: user4.id, wonder_id: wonder4.id, accepted: true)
puts "Creating reservation"
Reservation.create(start_date: Date.new(2024, 7, 5), end_date: Date.new(2024, 7, 10), price: 1500, user_id: user5.id, wonder_id: wonder5.id, accepted: true)
puts "Creating reservation"
Reservation.create(start_date: Date.new(2024, 8, 15), end_date: Date.new(2024, 8, 20), price: 1250, user_id: user6.id, wonder_id: wonder6.id, accepted: true)
puts "Creating reservation"
Reservation.create(start_date: Date.new(2024, 9, 25), end_date: Date.new(2024, 9, 30), price: 1750, user_id: user7.id, wonder_id: wonder7.id, accepted: true)
puts "Done!"
