# Fake User

User.create(email: "john.doe@example.com", encrypted_password: "encryptedpassword123", reset_password_token: nil, reset_password_sent_at: nil, remember_created_at: nil)
User.create(email: "jane.smith@example.com", encrypted_password: "encryptedsecurePassword!", reset_password_token: nil, reset_password_sent_at: nil, remember_created_at: nil)
User.create(email: "alex.taylor@example.com", encrypted_password: "encryptedpassword456", reset_password_token: nil, reset_password_sent_at: nil, remember_created_at: nil)
User.create(email: "sam.jordan@example.com", encrypted_password: "encryptedsecurePassword789", reset_password_token: nil, reset_password_sent_at: nil, remember_created_at: nil)
User.create(email: "casey.reed@example.com", encrypted_password: "encryptedpassword101112", reset_password_token: nil, reset_password_sent_at: nil, remember_created_at: nil)
User.create(email: "morgan.lee@example.com", encrypted_password: "encryptedsecurePassword131415", reset_password_token: nil, reset_password_sent_at: nil, remember_created_at: nil)
User.create(email: "jamie.parker@example.com", encrypted_password: "encryptedpassword161718", reset_password_token: nil, reset_password_sent_at: nil, remember_created_at: nil)



# Fake reservation

Reservation.create(start_date: Date.new(2024, 3, 1), end_date: Date.new(2024, 3, 5), price: 500, user_id: 1, wonder_id: 1, accepted: true)
Reservation.create(start_date: Date.new(2024, 4, 10), end_date: Date.new(2024, 4, 15), price: 750, user_id: 2, wonder_id: 2, accepted: false)
Reservation.create(start_date: Date.new(2024, 5, 10), end_date: Date.new(2024, 5, 15), price: 1000, user_id: 3, wonder_id: 3, accepted: true)
Reservation.create(start_date: Date.new(2024, 6, 20), end_date: Date.new(2024, 6, 25), price: 750, user_id: 4, wonder_id: 4, accepted: false)
Reservation.create(start_date: Date.new(2024, 7, 5), end_date: Date.new(2024, 7, 10), price: 1500, user_id: 5, wonder_id: 5, accepted: true)
Reservation.create(start_date: Date.new(2024, 8, 15), end_date: Date.new(2024, 8, 20), price: 1250, user_id: 6, wonder_id: 6, accepted: false)
Reservation.create(start_date: Date.new(2024, 9, 25), end_date: Date.new(2024, 9, 30), price: 1750, user_id: 7, wonder_id: 7, accepted: true)





# Fake wonders

Wonder.create(title: "Great Wall of China", price_per_day: 150, type: "Historic", location: "China", content: "Ancient series of walls and fortifications.", user_id: 2)
Wonder.create(title: "Eiffel Tower", price_per_day: 100, type: "Landmark", location: "Paris", content: "Iconic French landmark.", user_id: 1)
Wonder.create(title: "Statue of Liberty", price_per_day: 200, type: "Monument", location: "New York", content: "A colossal neoclassical sculpture on Liberty Island.", user_id: 3)
Wonder.create(title: "Colosseum", price_per_day: 150, type: "Historic", location: "Rome", content: "An oval amphitheatre in the centre of the city of Rome.", user_id: 4)
Wonder.create(title: "Machu Picchu", price_per_day: 300, type: "Ancient", location: "Peru", content: "An Incan citadel set high in the Andes Mountains.", user_id: 5)
Wonder.create(title: "Taj Mahal", price_per_day: 250, type: "Monument", location: "India", content: "An ivory-white marble mausoleum on the south bank of the Yamuna river.", user_id: 6)
Wonder.create(title: "Great Barrier Reef", price_per_day: 350, type: "Natural", location: "Australia", content: "The world's largest coral reef system.", user_id: 7)
