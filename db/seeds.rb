# Création d'un utilisateur
user = User.create(email: "exemple@email.com", password: "mot_de_passe")

# Création de quelques merveilles avec des réservations associées
wonders_data = [
  { title: "Wonder 1", price_per_day: 50, location: "Paris", type: "category", user_id: user.id },
  { title: "Wonder 2", price_per_day: 60, location: "New York", type: "category", user_id: user.id },
  { title: "Wonder 3", price_per_day: 70, location: "Tokyo", type: "category", user_id: user.id }
]

wonders_data.each do |wonder_params|
  wonder = Wonder.create(wonder_params)
  if wonder.persisted?
    puts "Wonder '#{wonder.title}' créé avec succès!"
  else
    puts "Erreur lors de la création de Wonder '#{wonder.title}': #{wonder.errors.full_messages.join(', ')}"
  end
end
