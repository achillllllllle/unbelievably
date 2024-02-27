puts "Clearing existing data..."
User.destroy_all
Wonder.destroy_all

puts "Creating users..."
users_info = [
  { email: "wizard@magicworld.com", password: "spellbound", username: "WizardWally", phone: "01 23 45 67 89", birth_date: "1970-10-31" },
  { email: "fairy@enchantedforest.com", password: "pixiedust", username: "FairyFiona", phone: "+33 2 34 56 78 90", birth_date: "1985-05-04" },
  { email: "sorcerer@apprentice.com", password: "magicwand", username: "SorcererSam", phone: "0033 3 45 67 89 01", birth_date: "1990-12-24" },
  { email: "time.traveler@chronos.com", password: "paradox", username: "TimTheTimeTraveler", phone: "04 56 78 90 12", birth_date: "1920-01-01" },
  { email: "pirate@sevenseas.com", password: "treasure", username: "PegLegPete", phone: "05 67 89 01 23", birth_date: "1680-09-19" },
]

users_info.each do |user_attrs|
  User.create!(user_attrs)
end

users = User.all
puts "Creating wonders..."
# A mix of magical, absurd, and adventurous wonders
wonders_info = [
  { title: "Mermaid Pool Party", price_per_day: 300, category: "Creature", location: "Miami", content: "Host an unforgettable pool party with a real-life mermaid. Entertainment and magic guaranteed!", user: users.sample },
  { title: "Haunted House Experience", price_per_day: 250, category: "Spectacle", location: "New Orleans", content: "Spend a night in a haunted house, complete with ghostly apparitions and spine-tingling stories.", user: users.sample },
  { title: "Cloud Sculpting Class", price_per_day: 180, category: "Adventure", location: "Nepal", content: "Learn to sculpt clouds into fantastic shapes with the help of a high-flying wizard. Skydiving equipment included.", user: users.sample },
  { title: "Goblin Gourmet Night", price_per_day: 220, category: "Spectacle", location: "New York", content: "Experience fine dining with dishes prepared by the world-renowned Goblin chefs. Palate excitement guaranteed!", user: users.sample },
  { title: "Underwater Basket Weaving", price_per_day: 140, category: "Magical Item", location: "Great Barrier Reef", content: "Weave the finest baskets on a scuba dive with mermaids. Waterproof baskets and scuba gear provided.", user: users.sample },
  { title: "Zero-Gravity Tea Party", price_per_day: 500, category: "Adventure", location: "International Space Station", content: "Enjoy a cup of tea while floating in zero gravity. Spacesuit and transportation included.", user: users.sample },
  # ... add more wonders here following the same structure
  { title: "Time Travel Excursion", price_per_day: 600, category: "Adventure", location: "Egypt", content: "Travel back in time to witness the construction of the pyramids. Historical accuracy not guaranteed.", user: users.sample },
  { title: "Invisibility Cloak Hide and Seek", price_per_day: 250, category: "Magical Item", location: "Hogwarts", content: "Play hide and seek in the Hogwarts castle, using genuine invisibility cloaks. Mischief managed!", user: users.sample },
  { title: "Leprechaun Gold Hunt", price_per_day: 250, category: "Adventure", location: "Ireland", content: "Hunt for leprechaun gold at the end of the rainbow. Shovels and raincoats provided.", user: users.sample },
  { title: "Pirate Ship Sailing Class", price_per_day: 350, category: "Adventure", location: "Caribbean", content: "Learn to sail a pirate ship with a crew of friendly ghosts. Eye patches and parrots included.", user: users.sample },
  { title: "Vampire Wine Tasting", price_per_day: 300, category: "Spectacle", location: "Transylvania", content: "Taste the finest wines in Dracula's castle. Garlic necklaces and wooden stakes provided for safety.", user: users.sample },
  { title: "Antigravity Dance Party", price_per_day: 450, category: "Adventure", location: "Tokyo", content: "Dance the night away in an antigravity chamber. Glow sticks and moon boots provided.", user: users.sample },
  { title: "Telekinetic Chess Tournament", price_per_day: 100, category: "Magical Item", location: "Cambridge", content: "Play chess using only your mind. Training in telekinesis provided upon arrival.", user: users.sample },
  { title: "Broomstick Flying Lessons", price_per_day: 320, category: "Adventure", location: "Salem", content: "Learn to fly a broomstick with certified witch instructors. Helmets and knee pads included.", user: users.sample },
  # ... continue adding wonders as needed
]

wonders_info.each do |wonder_attrs|
  Wonder.create!(wonder_attrs)
end

puts "Data seeded successfully!"
