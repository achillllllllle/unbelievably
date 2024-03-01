puts "Clearing existing data..."
Reservation.destroy_all
Favorite.destroy_all
User.destroy_all
Wonder.destroy_all

puts "Creating users..."
users_info = [
  { email: "test@test.com", password: "azerty", username: "TestUser", phone: "01 28 45 67 89", birth_date: "1971-10-31" },
  { email: "wizard@magicworld.com", password: "spellbound", username: "WizardWally", phone: "01 23 45 67 89", birth_date: "1970-10-31", avatar: "app/assets/images/avatar_wizard.jpeg" },
  { email: "fairy@enchantedforest.com", password: "pixiedust", username: "FairyFiona", phone: "+33 2 34 56 78 90", birth_date: "1985-05-04", avatar: "app/assets/images/avatar_fairy.webp" },
  { email: "sorcerer@apprentice.com", password: "magicwand", username: "SorcererSam", phone: "0033 3 45 67 89 01", birth_date: "1990-12-24", avatar: "app/assets/images/avatar_sorcer.webp" },
  { email: "time.traveler@chronos.com", password: "paradox", username: "TimTheTimeTraveler", phone: "04 56 78 90 12", birth_date: "1920-01-01", avatar: "app/assets/images/avatar_time.jpeg" },
  { email: "pirate@sevenseas.com", password: "treasure", username: "PegLegPete", phone: "05 67 89 01 23", birth_date: "1680-09-19", avatar: "app/assets/images/avatar_pirate.webp" },
  # Ajout de nouveaux utilisateurs pour atteindre un total de 25
  { email: "explorer@adventures.com", password: "exploreMore", username: "ExplorerElla", phone: "01 47 85 67 41", birth_date: "1989-06-21" },
  { email: "artist@canvas.com", password: "creativeSoul", username: "ArtistAria", phone: "01 49 75 85 60", birth_date: "1978-02-14" },
  { email: "writer@stories.com", password: "wordsmith", username: "WriterWendy", phone: "01 58 39 20 41", birth_date: "1982-11-30" },
  { email: "chef@gourmet.com", password: "culinaryGenius", username: "ChefCharlie", phone: "01 59 23 87 23", birth_date: "1975-08-16" },
  { email: "dancer@rhythm.com", password: "danceLife", username: "DancerDanny", phone: "01 60 48 39 22", birth_date: "1990-05-25" },
  { email: "singer@melody.com", password: "melodicVoice", username: "SingerSylvia", phone: "01 61 59 40 23", birth_date: "1986-09-11" },
  { email: "gardener@flora.com", password: "greenThumb", username: "GardenerGina", phone: "01 62 70 51 24", birth_date: "1983-03-05" },
  { email: "biker@roads.com", password: "openRoads", username: "BikerBob", phone: "01 63 81 62 25", birth_date: "1979-07-20" },
  { email: "pilot@skies.com", password: "aboveClouds", username: "PilotPam", phone: "01 64 92 73 26", birth_date: "1988-12-12" },
  { email: "scientist@research.com", password: "eureka", username: "ScientistSam", phone: "01 65 03 84 27", birth_date: "1976-04-18" },
  { email: "athlete@sports.com", password: "goForGold", username: "AthleteAndy", phone: "01 66 14 95 28", birth_date: "1987-10-09" },
  { email: "teacher@education.com", password: "teachLearn", username: "TeacherTina", phone: "01 67 25 06 29", birth_date: "1981-01-24" },
  { email: "photographer@images.com", password: "captureMoments", username: "PhotographerPhil", phone: "01 68 36 17 30", birth_date: "1984-05-15" },
  { email: "astronomer@stars.com", password: "starGazer", username: "AstronomerAlice", phone: "01 69 47 28 31", birth_date: "1977-09-02" },
  { email: "magician@illusions.com", password: "abracadabra", username: "MagicianMilo", phone: "01 70 58 39 32", birth_date: "1991-03-22" },
  { email: "architect@buildings.com", password: "designDreams", username: "ArchitectAnna", phone: "01 71 69 50 33", birth_date: "1974-08-30" },
  { email: "vet@animalcare.com", password: "loveAnimals", username: "VetVicky", phone: "01 72 80 61 34", birth_date: "1985-02-17" },
  { email: "firefighter@bravery.com", password: "fireFight", username: "FirefighterFelix", phone: "01 73 91 72 35", birth_date: "1980-06-06" },
  { email: "detective@cases.com", password: "solveMysteries", username: "DetectiveDrew", phone: "01 74 02 83 36", birth_date: "1978-12-10" },
]

users = users_info.map do |user_attrs|
  avatar_path = user_attrs.delete(:avatar)
  user = User.create!(user_attrs)

  if avatar_path && File.exist?(Rails.root.join(avatar_path))
    user.avatar.attach(io: File.open(Rails.root.join(avatar_path)), filename: File.basename(avatar_path))
  else
    user.add_default_avatar
  end

  user
end

puts "#{users.size} users created successfully!"
puts "Creating wonders..."
# Exemple d'ajout de merveilles en associant chaque utilisateur avec sa merveille
# Note: Assurez-vous d'associer correctement les utilisateurs en fonction de leur username ou une autre logique spécifique

users = User.all
wizard_wally = users.find { |u| u.username == "WizardWally" }
fairy_fiona = users.find { |u| u.username == "FairyFiona" }
sorcerer_sam = users.find { |u| u.username == "SorcererSam" }
pegleg_pete = users.find { |u| u.username == "PegLegPete" }
time_traveler = users.find { |u| u.username == "TimTheTimeTraveler" }
wonders_info = [
  {
  title: "Mermaid Pool Party",
  price_per_participant: 300,
  category: "Creature",
  location: "Miami",
  content: "Host an unforgettable pool party with a real-life mermaid. Entertainment and magic guaranteed!",
  user: fairy_fiona,
  long_description: "Plunge into the ultimate fantasy with our Mermaid Pool Party, an experience that transforms the crystal-clear waters of Miami into a shimmering stage where the line between myth and reality blurs. From the moment the sun kisses the horizon at 2 PM to when the moon bathes the pool in a silvery glow, guests are transported into a world where mermaids aren't just creatures of lore but enchanting hosts of an aquatic gala like no other. This extravaganza isn't merely about witnessing; it's about interacting with these mystical beings as they share tales of underwater kingdoms, perform aerials that defy the constraints of the water, and invite you to join in dances that ripple through the waves.

  Guest attire is an essential element of the immersion. We encourage all attendees to adorn themselves in garments that echo the essence of the sea—glimmering sequins, scales, and fabrics that flow like the ocean currents themselves. But be forewarned: mermaids are known for their playful spirits, often challenging guests to contests of aquatic agility or enticing them into treasure hunts that delve into the depths of the pool, where secrets and surprises await.

  Each moment is an opportunity for wonder, with underwater photographers capturing every enchanting interaction, ensuring that your memories of this unparalleled event are preserved in stunning detail. Yet, these magical beings are elusive; their beauty may enchant the lens to the point of mystical interference, adding an ethereal quality to every image.

  The location of this mermaid rendezvous remains a closely guarded secret, disclosed only to confirmed attendees. Rumors speak of an enchanted underwater entrance for those brave enough to embrace the full depth of the experience. As the day turns to night, the pool's surface becomes a mirror to the stars above, inviting guests to ponder the vast mysteries of the oceans and the creatures that dwell within. Prepare to dive into a realm where dreams are not just visions of the night but vivid realities to be lived and cherished.
  ",
  photo_paths: ['app/assets/images/mermaid.webp']
},
{
  title: "Haunted House Experience",
  price_per_participant: 250,
  category: "Spectacle",
  location: "New Orleans",
  content: "Spend a night in a haunted house, complete with ghostly apparitions and spine-tingling stories.",
  user: sorcerer_sam,
  long_description: "Dare to step beyond the veil with our Haunted House Experience, a journey that beckons from the dimly lit streets of New Orleans, winding its way into the heart of darkness where shadows whisper, and the past never rests. As the clock strikes the witching hour, the boundary between the living and the spectral dissolves, inviting the bravest souls to venture through the creaking doors of an estate forsaken by time but inhabited by entities beyond our understanding.

  This is no mere walk through cobwebbed halls; it's an immersive expedition into the depths of the paranormal. Armed with state-of-the-art ghost-detecting gear and sage for protection—or provocation, for those who seek to pierce the veil even further—guests will navigate through rooms where history's echoes are not just heard but felt. Expect sudden chills as you pass through ethereal presences, whispers from unseen lips, and perhaps a spectral touch upon your shoulder in the darkness.

  At the heart of this haunted manor, in the attic where the air is thick with secrets, a midnight séance will be conducted. Here, amid ancient tomes and flickering candles, participants will reach out to the spirits that roam these halls, guided by a medium whose voice bridges the worlds of the living and the dead. It's said that in this room, the veil is thinnest, a gateway to realms beyond our comprehension.

  Participants are advised to dress for agility as much as for atmosphere; the spirits are playful, and the mansion's corridors are many. Comfortable footwear is a must, for when the spirits stir, the line between hunter and hunted may blur, and a swift escape—or pursuit—could be in order.

  The Haunted House Experience promises not just thrills but a profound connection to the mysteries that lie beyond the grasp of the living. It's an invitation to confront the unknown, to touch the essence of fear and curiosity that binds the living to the spirits of the past. As dawn breaks and you emerge from the shadowed embrace of the estate, you'll carry with you not just memories but a deeper understanding of the spectral threads that weave through the tapestry of our world.
  ",
  photo_paths: ['app/assets/images/haunted_house.webp']
},
{
  title: "Cloud Sculpting Class",
  price_per_participant: 180,
  category: "Adventure",
  location: "Nepal",
  content: "Learn to sculpt clouds into fantastic shapes with the help of a high-flying wizard. Skydiving equipment included.",
  user: time_traveler,
  long_description: "Ascend to the heavens with our Cloud Sculpting Class, a unique adventure that elevates the artistry of the skies to realms only dreamed of. Nestled among the towering peaks of Nepal, where the earth kisses the sky, this ethereal workshop begins at the break of dawn, as the first light bathes the world in a golden glow, and continues until dusk, when the clouds blush with the setting sun. Here, under the tutelage of a master wizard whose lineage traces back to the ancients who first whispered to the winds, you will learn the secrets of cloud manipulation, shaping the very fabric of the sky with tools enchanted for the purpose.

  Each participant is granted a set of cloud chisels, tools not of this earth but forged in the elemental forges of air and water, designed to carve vapors into shapes as intricate as your imagination allows. Safety, a paramount concern when working at such altitudes, is ensured with goggles enchanted to provide clarity amidst the mist and gloves that ward off the chill of the high winds. However, adventurers be warned: the art of cloud sculpting requires not just creativity but a readiness to adapt, as the medium is ever-shifting, as fleeting as the wind itself.

  Beyond the artistry, this experience offers an adrenaline rush like no other. The class concludes with a skydiving descent back to base camp, a thrilling plunge through the very sculptures you've crafted, witnessing their grandeur from a perspective few will ever know. It's a reminder of the impermanence of art and nature, a dance with the sky that ends with a return to earth, feet grounded but spirit forever aloft.

  Participants are advised to travel light, as excess weight can tether the soul too closely to the ground. Attire should be warm yet freeing, allowing for movement and the occasional embrace of a passing cloud. Be prepared for the workshop to extend beyond the constraints of time, for when you're sculpting the sky, hours meld into moments, and moments stretch into eternity.

  This Cloud Sculpting Class is more than a lesson in art; it's an invitation to join a cadre of sky artists, a select group who look upwards not just in wonder but with the knowledge to shape dreams into reality. As you descend from the peaks, your creations dissipating behind you, you'll carry the sky in your heart, and the clouds, once mere wisps in the wind, will forever bear the mark of your imagination.
  ",
  photo_paths: ['app/assets/images/clouds.webp']
},
{
  title: "Goblin Gourmet Night",
  price_per_participant: 220,
  category: "Spectacle",
  location: "New York",
  content: "Experience fine dining with dishes prepared by the world-renowned Goblin chefs. Palate excitement guaranteed!",
  user: users.sample,
  long_description: "Delve into the depths of culinary mystery with our Goblin Gourmet Night, an exclusive event that takes place in the hidden catacombs beneath the bustling streets of New York City. As the clock chimes seven, signaling the start of an evening shrouded in secrecy, guests are escorted through ancient stone passages, lit only by flickering torches, to a dining hall that has hosted the most illustrious of goblin chefs for centuries. Here, amid the echoes of a thousand feasts, you will partake in a gastronomic journey unparalleled in both this world and the next.

  Each dish served is a masterpiece of goblin culinary excellence, a blend of flavors so bold and unexpected that they challenge the very notion of cuisine. The chefs, masters of their craft, weave magic into their recipes, using ingredients sourced from the enchanted forests and forbidden markets of the goblin realms. Diners are provided with a menu that reads like an adventure novel, each course promising thrills for the palate and tales of daring procurements. Be forewarned, though: goblin delicacies are not for the faint of heart, and guests are encouraged to bring an appetite for the unknown.

  To enhance the experience, each course is paired with a potion, carefully selected to complement the dish and heighten the senses. Some potions may cause temporary changes in perception—don't be alarmed if the room seems to grow, or if you find yourself conversing in the ancient goblin tongue. These effects are all part of the experience, a taste of the world from a goblin's point of view.

  The dress code for the evening is enchantingly elegant, with a touch of goblin chic—think dark velvets, shimmering silks, and jewels that glow with an inner light. As the night progresses, the chefs themselves might join your table, sharing stories of their culinary adventures and perhaps challenging guests to a taste test of mysterious concoctions.

  Goblin Gourmet Night is more than a meal; it's a foray into a realm where food is both art and adventure, a night where every bite tells a story, and every dish is a doorway to the extraordinary. As you emerge from the catacombs, the flavors of the night lingering on your tongue, you'll carry with you memories of a feast like no other, a testament to the culinary magic that only goblins can conjure.
  ",
  photo_paths: ['app/assets/images/goblin.webp']
},
{
  title: "Underwater Basket Weaving",
  price_per_participant: 140,
  category: "Magical Item",
  location: "Great Barrier Reef",
  content: "Weave the finest baskets on a scuba dive with mermaids. Waterproof baskets and scuba gear provided.",
  user: fairy_fiona,
  long_description: "Submerge into the serene yet surreal world of Underwater Basket Weaving, a craft so unique it could only be taught by the mermaids of the Great Barrier Reef. As dawn's first light filters through the water, illuminating the vibrant corals and dancing schools of fish, participants gather at a secret cove, where the sea itself invites you to dive into an experience unlike any other. Under the guidance of mermaid artisans, whose lineage is as ancient as the ocean, you will learn to weave baskets with materials harvested from the seabed, infused with the magic of the deep.

  Equipped with enchanted scuba gear that allows for effortless communication under the waves, participants will find themselves part of an aquatic ballet, where each movement is a stroke of creation, and every breath draws inspiration from the ocean's depths. The mermaids, playful yet patient instructors, will introduce you to seaweeds that change color with your touch and corals that lend their strength to your creations. But be wary of the mischievous sea turtles, known to unravel baskets with a cheeky flick of their flippers as a reminder that in the ocean, play is part of the process.

  This activity isn't just about weaving baskets; it's an immersive exploration of the underwater world, a chance to create alongside creatures of legend. Participants are advised to wear swimwear that sparkles or glows, to complement the bioluminescent accessories provided. As you dive, weave, and laugh, you'll not only craft a basket but weave a bond with the sea that will call you back, time and again.

  After hours of creativity, as the sun begins to set, casting golden rays through the water, the workshop concludes with a mermaid-led tour of their favorite hidden spots within the reef. Here, amidst the wonders of their world, each participant's basket will be blessed in a ceremony as old as the tides, ensuring that the magic of the day is forever intertwined with their creation.

  As you surface, leaving the embrace of the sea behind, you'll carry with you not just a basket, but a treasure trove of memories, a piece of the ocean's heart crafted by your own hands. This Underwater Basket Weaving experience is a passport to a world beneath the waves, an invitation to create, explore, and become part of a story that flows as freely as the sea itself.
  ",
  photo_paths: ['app/assets/images/mermaidbasket.webp']
},
{
  title: "Zero-Gravity Tea Party",
  price_per_participant: 500,
  category: "Adventure",
  location: "International Space Station",
  content: "Enjoy a cup of tea while floating in zero gravity. Spacesuit and transportation included.",
  user: users.sample,
  long_description: "Imagine sipping Earl Grey tea as you float among the stars, the Earth a splendid blue jewel spinning below—welcome to the Zero-Gravity Tea Party, the most exclusive gathering this side of the stratosphere. Hosted aboard the International Space Station, this event transcends the traditional tea party, offering an experience that is literally out of this world. From the delicate clink of china to the gentle drift of tea leaves in zero gravity, every element has been meticulously planned to ensure an unforgettable celestial celebration.

  Upon arrival, guests are fitted with custom-designed spacesuits, blending the elegance of high tea attire with the functionality required for life in orbit. Magnetic tea cups prevent your Earl Grey from becoming a floating globule, while specially engineered scones and sandwiches ensure that not even a crumb escapes to wander the cabin. The dress code is, of course, spacesuit chic, with accessories that nod to the whimsy of this high-altitude affair—think star-shaped cufflinks and asteroid belt buckles.

  The challenges of pouring and enjoying tea in zero gravity add a delightful twist to the proceedings, as guests learn to navigate the unique environment with grace and humor. Floating from one conversation to another, the party is a ballet of bodies and beverages, a dance choreographed by the laws of physics themselves.

  But this tea party offers more than just exquisite teas and cosmic vistas. It's an opportunity to connect with fellow adventurers, to share stories of earthly travels and spaceborne dreams, all while orbiting the planet at 17,500 miles per hour. The experience is capped off with a spacewalk, allowing guests to step outside the station and take in the incomparable view of Earth from above, tea cup in hand.

  As the party winds down and the shuttle prepares to return to Earth, guests are left with a sense of wonder, a reminder of the boundless possibilities that await when we dare to step beyond our world. The Zero-Gravity Tea Party is not just an event; it's a milestone, marking a moment when the human spirit of exploration turned the simple act of enjoying tea into an interstellar adventure.
  ",
  photo_paths: ['app/assets/images/spacetea.webp']
},
{
  title: "Time Travel Excursion",
  price_per_participant: 600,
  category: "Adventure",
  location: "Egypt",
  content: "Travel back in time to witness the construction of the pyramids. Historical accuracy not guaranteed.",
  user: time_traveler,
  long_description: "Embark on a voyage beyond the bounds of time with our Time Travel Excursion, where history is not just observed but experienced. This unparalleled journey begins at the stroke of midnight, under the cloak of a new moon, where the fabric of time is thinnest. Our destination: ancient Egypt, to witness the marvels of the pyramids' construction, an event shrouded in mystery and awe. As you step through the portal, you'll be adorned in period attire, blending seamlessly with the denizens of the past, your presence a whisper in the annals of history.

  Equipped with a time-traveler's toolkit—sun hats, sandals woven from the reeds of the Nile, and a phrasebook translating modern expressions into ancient dialects—you're prepared for a day where every moment is a page from history. Our guides, scholars of the arcane and masters of the temporal arts, ensure your passage through time is both safe and enlightening. They'll share tales of pharaohs and gods, of stars aligning to herald great events, and the magic that binds the stones.

  Participants are advised to tread lightly, for the sands of time are delicate. The thrill of witnessing history unfold is tempered with the responsibility of preserving the timeline. You'll explore the bustling marketplaces, engage with the architects and laborers of the pyramids, and perhaps even catch a glimpse of Cleopatra herself. Each encounter is a thread in the tapestry of history, yours to weave with care.

  As the sun sets over the Nile, casting long shadows from the pyramids, a feast fit for royalty awaits. Dine under the stars on dishes recorded in ancient scrolls, each bite a taste of history, each flavor a bridge across millennia. But beware, for the allure of the past can be intoxicating. Remember, you are but a ghost in this world, a specter passing through.

  The return journey to the present is a reflective one, as the wonders of the past give way to the familiar stars of home. Participants carry back not just memories but a profound connection to the human saga, a realization that our time is but one chapter in an epic that spans the ages. The Time Travel Excursion is more than an adventure; it's a pilgrimage through the annals of humanity, a journey that challenges our understanding of time, history, and our place within it.
  ",
  photo_paths: ['app/assets/images/time_travel.webp']
},
{
  title: "Invisibility Cloak Hide and Seek",
  price_per_participant: 250,
  category: "Magical Item",
  location: "Hogwarts",
  content: "Play hide and seek in the Hogwarts castle, using genuine invisibility cloaks. Mischief managed!",
  user: sorcerer_sam,
  long_description: "Venture into the realm of the unseen with our Invisibility Cloak Hide and Seek, an enchanting game set within the hallowed halls of Hogwarts. As twilight descends, casting long shadows across the castle, participants don the legendary invisibility cloaks, woven from the hair of Demiguise and enchanted with spells of concealment. The game, a timeless tradition among wizards and witches, transforms the familiar corridors and secret passages into a playground of mystery and mischief.

  The rules are simple, yet the play is anything but. Cloaked in invisibility, seekers and hiders move with silent footsteps, their presence betrayed only by the faintest whisper of fabric or the occasional giggle muffled by magic. The castle itself becomes an ally to some and a trickster to others, its shifting staircases and hidden rooms offering refuge or leading astray with equal whimsy.

  Participants are advised to dress in soft, noiseless attire, the better to blend with the whispers of the castle. Comfortable shoes are a must, for the game spans the breadth of Hogwarts, from the dungeons to the towers, and even into the Forbidden Forest, where the moonlight filters through ancient trees. The game is a dance of shadows and silence, a test of skill, strategy, and a bit of luck.

  As the night deepens, the boundaries of the game blur. Stories are shared in hushed tones, legends of Hogwarts and its inhabitants, of bravery and friendship. The game concludes not with a victor but with a gathering in the Great Hall, where participants, visible once more, share tales of their adventures over cups of steaming cocoa and plates of treacle tart.

  Invisibility Cloak Hide and Seek is more than a game; it's a journey into the heart of magic, a reminder of the joy and wonder that binds the wizarding world. Participants leave with memories of laughter echoing through the corridors, of the thrill of the chase, and the warmth of newfound friendships, the magic of the night lingering long after the cloaks are returned to their secret keep.
  ",
  photo_paths: ['app/assets/images/invisibility.webp']
},
{
  title: "Leprechaun Gold Hunt",
  price_per_participant: 250,
  category: "Adventure",
  location: "Ireland",
  content: "Hunt for leprechaun gold at the end of the rainbow. Shovels and raincoats provided.",
  user: wizard_wally,
  long_description: "Immerse yourself in the emerald isles' most enchanting folklore with our Leprechaun Gold Hunt, a whimsical adventure that beckons from the lush, mist-covered hills of Ireland. As dawn breaks, painting the sky in hues of gold and pink, hunters gather at the edge of a rainbow, where legend says the leprechauns hide their pots of gold. This isn't merely a hunt; it's a journey into the heart of Irish myth, a quest for fortune guided by riddles whispered on the wind and clues hidden in ancient runes.

  Equipped with gold-detecting rods and rainbow-resistant sunglasses, adventurers set forth into the wilderness, their spirits as bright as the morning. The leprechauns, elusive and cunning, have laid a trail of puzzles and traps, each more challenging than the last. Hunters must navigate through enchanted forests, across babbling brooks, and over rolling green hills, all while keeping an eye out for fairy circles and other supernatural pitfalls.

  Participants are encouraged to wear boots sturdy enough to tread on fairy paths and coats that blend with the foliage, for stealth is as crucial as speed in this game. The leprechauns are watching, ready to spring their mischievous magic on the unwary. Yet, the journey is filled with laughter and camaraderie, as hunters share tales of leprechaun encounters and sing songs that are said to lure the wee folk out of hiding.

  As the hunt progresses, the bond between the hunters strengthens, transforming strangers into fellow adventurers united by a common quest. The hunt culminates at dusk, in a glen where the setting sun sets the sky ablaze, mirroring the golden glow of the treasure sought. Here, amidst ancient stones that have borne witness to centuries of hunts, the leprechauns themselves join the celebration, their laughter mingling with the hunters' as they share the true wealth of Ireland—stories, friendship, and the magic of the isle.

  The Leprechaun Gold Hunt is more than an adventure; it's a passage into the heart of Irish folklore, an experience that weaves the fabric of myth into the tapestry of reality. Hunters leave with pockets light of gold but hearts rich with memories, their spirits forever touched by the mischievous charm of the leprechauns and the timeless beauty of Ireland.
  ",
  photo_paths: ['app/assets/images/irland.webp']
},
{
  title: "Pirate Ship Sailing Class",
  price_per_participant: 350,
  category: "Adventure",
  location: "Caribbean",
  content: "Learn to sail a pirate ship with a crew of friendly ghosts. Eye patches and parrots included.",
  user: pegleg_pete,
  long_description: "Set sail on the adventure of a lifetime with our Pirate Ship Sailing Class, where the Caribbean's crystal waters become your playground, and the horizon is not a limit but a destination. As the sun rises, casting its golden light upon the docks, aspiring pirates gather, their eyes alight with the thrill of the unknown. This is no ordinary sailing lesson; it's an initiation into a life of adventure, where the Jolly Roger flies high, and the sea calls to the heart of every explorer.

  Under the tutelage of a crew of friendly ghosts, remnants of a pirate era long gone but not forgotten, participants learn the art of navigation, the secrets of the trade winds, and the language of the sea. These spectral sailors, bound to the ship by tales of unfinished quests, share their knowledge with a generosity only the timeless possess. Each participant is equipped with a personalized pirate hat, an eye patch, and a temporary parrot companion, ensuring that they look the part as they take the helm, hoist the sails, and chart a course into legend.

  The class covers everything from reading stars to sword fighting, from the etiquette of plundering to the crafting of a perfect sea shanty. The ship itself is a marvel, a restored galleon that has seen battles and braved storms, its decks echoing with the whispers of the past. Participants are warned: the ghost crew loves a good prank, and a sudden squall or an unexpected dance-off is not beyond them.

  As the day wanes, the ship anchors in a secluded cove, where a treasure hunt begins, leading to a feast under the stars. Here, stories are shared over rum and roasted fish, tales of bravery, betrayal, and the bonds formed upon the sea. The Pirate Ship Sailing Class is not just about learning to sail; it's about discovering the pirate within, about finding freedom on the waves and camaraderie in the face of adventure.

  As the ship returns to port, illuminated by the first light of dawn, participants step ashore transformed, not just in appearance but in spirit. They've not only mastered the skills of the sea but embraced its call, the promise of adventure that lies beyond the horizon. The Pirate Ship Sailing Class is an invitation to set sail on a journey not just across the ocean, but into the heart of adventure itself, where the sea's timeless call beckons to the soul of every explorer.
  ",
  photo_paths: ['app/assets/images/pirate.webp']
},
{
  title: "Vampire Wine Tasting",
  price_per_participant: 300,
  category: "Spectacle",
  location: "Transylvania",
  content: "Taste the finest wines in Dracula's castle. Garlic necklaces and wooden stakes provided for safety.",
  user: wizard_wally,
  long_description: "Step into the shadows of Transylvania for a Vampire Wine Tasting experience that transcends the ordinary, merging the allure of ancient mystique with the refined pleasure of wine. As twilight descends upon the land, casting its purple hue over the Carpathian Mountains, guests are summoned to the imposing gates of Dracula's Castle. This evening is not just about savoring wine; it's an immersion into a world where history, horror, and hedonism intertwine.

  Upon entry, participants are adorned with garlic necklaces, a stylish yet protective accessory, and handed a wooden stake—just in case. The castle, a labyrinth of stone and shadow, opens its secrets to those daring enough to explore its depths. Each chamber reveals a different vintage, carefully selected from the castle's ancient cellars, where bottles lay dust-covered but preserved, their contents a testament to centuries of winemaking mastery.

  The wines, a mix of rare reds and enigmatic whites, are paired with an assortment of culinary delights prepared by the castle's undead chefs. These dishes, though devoid of garlic for obvious reasons, tantalize the palate with flavors both familiar and otherworldly. As the night unfolds, the vampire host, a charming yet mysterious figure, regales guests with tales of the castle's storied past, of battles fought and loves lost, of the eternal dance between darkness and light.

  Participants are encouraged to dress in their most elegantly eerie attire, blending in with the castle's ghostly inhabitants who, attracted by the mirth and music, might just join the festivities. The experience is as much a feast for the senses as it is a journey into the heart of vampire lore, where each sip of wine is a communion with the past, and every shadow hides a story.

  As the tasting progresses, guests are invited to a secret chamber for a 'mystery' drink, a concoction said to be favored by vampires for its invigorating properties. This potion, a blend of secret ingredients and a touch of magic, promises to awaken the nightwalker within, offering a glimpse into the thrill of immortality.

  The Vampire Wine Tasting experience concludes with a toast, not just to the wines savored or the tales shared, but to the night itself, to the mystery and allure that envelops Transylvania. Guests depart with a newfound appreciation for the complexity of vampire culture, their senses enriched, their hearts beating with the pulse of adventure, and perhaps, a lingering question: what does it truly mean to taste the night?
  ",
  photo_paths: ['app/assets/images/vampire.webp']
},
{
  title: "Antigravity Dance Party",
  price_per_participant: 450,
  category: "Adventure",
  location: "Tokyo",
  content: "Dance the night away in an antigravity chamber. Glow sticks and moon boots provided.",
  user: users.sample,
  long_description: "Prepare to defy the laws of physics and elevate your party experience with our Antigravity Dance Party, a cosmic celebration set against the neon-lit backdrop of Tokyo's skyline. As dusk gives way to the electric night, adventurers and thrill-seekers converge on a hidden laboratory, where science meets spectacle, and the dance floor floats free from the confines of gravity.

  Equipped with zero-gravity boots and illuminated by glow sticks that cut through the darkness like comets, guests are launched into an antigravity chamber, a space where the usual rules don't apply. Here, music pulsates not just through the air but through the very fabric of space, each beat a heartbeat driving the dance of the cosmos.

  The DJs, masters of their craft, spin a mix of gravity-defying beats and interstellar melodies, orchestrating a dance party that transcends earthbound limitations. Participants find themselves not just dancing but soaring, spinning, and somersaulting through the air, their movements a ballet choreographed by the forces of physics and the freedom of weightlessness.

  The party is a spectacle of light and motion, with lasers painting the air in vibrant hues and dancers adorned in outfits that reflect the cosmic theme—metallic fabrics, LED accessories, and makeup that glows under the black lights. It's an immersive experience that challenges perception, where the ceiling becomes the floor, and walls dissolve into infinity.

  But the Antigravity Dance Party is more than just an extraordinary celebration; it's a testament to human creativity and the boundless potential for joy. As the night draws to a close, and gravity reclaims its hold, guests return to the ground transformed, their spirits lifted by the experience of absolute freedom, their minds expanded by the possibilities that lie beyond the boundaries of the known.

  This event is not just remembered; it's felt in the core of one's being, a reminder that, in a universe of endless gravity, we have the power to rise, to dance among the stars, and to create moments of unbridled joy that linger long after the music fades.
  ",
  photo_paths: ['app/assets/images/party_1.webp', 'app/assets/images/party_2.webp']
},
{
  title: "Telekinetic Chess Tournament",
  price_per_participant: 100,
  category: "Magical Item",
  location: "Cambridge",
  content: "Play chess using only your mind. Training in telekinesis provided upon arrival.",
  user: users.sample,
  long_description: "Embark on a cerebral odyssey with our Telekinetic Chess Tournament, a gathering that transcends the conventional bounds of board games, hosted within the hallowed and historic halls of Cambridge. This is not merely a test of strategy and foresight; it's an arena where mind battles mind, with the pieces responding not to the touch of hands but to the will of thought. As the morning mist dissipates, revealing the ancient spires of the university, participants from diverse disciplines converge, their minds honed and ready for battle.

  Upon entry, each contender is provided with a telekinesis starter kit, a collection of items designed to enhance mental focus and psychic ability. This includes a meditation guide for centering one's thoughts, a set of miniature chess pieces for practice, and a headband that measures cerebral activity, glowing brighter as concentration deepens. The tournament unfolds in silence, a profound quiet broken only by the soft clicks of pieces moving across the board as if by magic.

  The game is a spectacle of mental agility and prowess, with spectators watching in awe as pawns, knights, and queens glide across the board, each move a testament to the power of the mind. The air is charged with anticipation and the subtle electricity of brainwaves in competition, as strategies are formed and countered in the silent theatre of thought.

  Participants are cautioned against overexertion; tales from past tournaments tell of chess pieces levitating in sudden bursts of psychic energy, only to crash down in moments of concentration lapse. Between matches, mind-calming teas and meditation sessions are offered, providing a respite for the mental athletes and an opportunity for spectators to learn basic telekinesis, turning the event into a celebration of the human mind's untapped potentials.

  As the tournament reaches its climax, with the final contenders locked in a battle of wits and wills, the excitement is palpable. The champion, crowned not just for their skill in chess but for their mastery over the unseen force of telekinesis, is celebrated in a closing ceremony that honors the ancient and the futuristic, the intellectual and the mystical.

  The Telekinetic Chess Tournament is more than a competition; it's a journey into the realm of possibility, a challenge to the limits of the human mind, and a testament to the power of focused thought. Participants and spectators alike leave with a deepened sense of wonder, a glimpse into a future where the mind's potential is fully unleashed, and the world is richer for it.
  ",
  photo_paths: ['app/assets/images/chess.webp']
},
{
  title: "Broomstick Flying Lessons",
  price_per_participant: 320,
  category: "Adventure",
  location: "Salem",
  content: "Learn to fly a broomstick with certified witch instructors. Helmets and knee pads included.",
  user: sorcerer_sam,
  long_description: "Ascend into the realm of myth and magic with our Broomstick Flying Lessons, an exhilarating opportunity to take to the skies and master the ancient art of broomstick aviation. As the dawn casts its first light over Salem, the air tinged with the scent of adventure, enthusiasts of all ages gather on a field shrouded in mists and legend. Here, where the boundary between the mundane and magical blurs, participants are introduced to their brooms, each one a masterpiece of craftsmanship, combining traditional witching materials with modern aerodynamics for the perfect flight experience.

  The day begins with a grounding in the basics of broomstick lore, including the selection of the right broom for one's spirit, the proper care and feeding of a broomstick, and the essential spells for takeoff, navigation, and landing. Safety is paramount, with enchantments woven into helmets and knee pads to protect against falls, and GPS spells to ensure no one strays too far into the unknown.

  Under the watchful eyes of certified witch instructors, participants take their first tentative levitations, the thrill of defiance against gravity igniting smiles and laughter. The sky becomes a playground, with exercises designed to build confidence and skill—races through floating hoops, gentle glides over the treetops, and for the bravely daring, a dive and swoop that sends hearts racing.

  As the sun reaches its zenith, a picnic lunch is served on a cloud, accessible only by broomstick, where stories of famous witches and their aerial adventures are shared, alongside sandwiches and potions that bubble with flavors as vibrant as the sky.

  The lessons conclude with a twilight game of Quidditch, the age-old sport of witches and wizards, allowing participants to put their new skills to the test in a friendly match that combines speed, strategy, and spellwork in equal measure. As stars begin to pepper the sky, the field below twinkles with the lights of a celebratory bonfire, where certificates of completion are awarded, and tales of the day's flights are embellished with each retelling.

  Our Broomstick Flying Lessons offer more than just the skill to navigate the heavens; they open the door to a world where magic is real, and dreams of flight are just a broomstick away. Participants leave with their feet barely touching the ground, their spirits soaring, and their hearts forever attuned to the call of the skies, a reminder that in a world bound by gravity, there are still places where we can fly free.
  ",
  photo_paths: ['app/assets/images/broomstick.webp']
}
]
wonders_info.each do |wonder_attrs|
  wonder = Wonder.create!(
    title: wonder_attrs[:title],
    price_per_participant: wonder_attrs[:price_per_participant],
    category: wonder_attrs[:category],
    location: wonder_attrs[:location],
    content: wonder_attrs[:content],
    long_description: wonder_attrs[:long_description],
    user: wonder_attrs[:user]
  )

  wonder_attrs[:photo_paths].each do |photo_path|
    wonder.photos.attach(io: File.open(photo_path), filename: File.basename(photo_path))
  end
end
puts "Wonders created successfully!"

puts "Creating reservations..."

def set_user_wonder
  user = User.all.sample
  wonders = Wonder.where.not(user_id: user.id)
  wonder = wonders.sample

  # Vérifie si wonder est nil et relance la méthode si nécessaire
  if wonder.nil?
    set_user_wonder
  else
    [user, wonder]
  end
end

user_wonder_pairs = []
25.times do |i| # Adaptez le nombre à votre besoin
  user_wonder_pairs << set_user_wonder
end

reservations_info = user_wonder_pairs.map.with_index do |(user, wonder), index|
  nb_participants = rand(1..10)
  book_date = (Date.today + index.days).to_s
  price = nb_participants * wonder.price_per_participant

  {
    book_date: book_date,
    nb_participants: nb_participants,
    price: price,
    user: user,
    wonder: wonder
  }
end

reservations_info.each do |reservation_attrs|
  Reservation.create!(reservation_attrs)
end

puts "Reservations created successfully!"
