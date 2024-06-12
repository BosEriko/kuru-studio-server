# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
users = [
  { name: "Roy Mustang", email: "roy@fma.com" },
  { name: "Rintaro Okabe", email: "okabe@gate.com" },
  { name: "Caped Baldy", email: "saitama@opm.com" },
  { name: "Lelouch Lamperouge", email: "lelouch@geass.com" },
  { name: "Monkey D. Luffy", email: "luffy@strawhat.com" },
  { name: "Edward Elric", email: "edward@alchemy.com" },
  { name: "Naruto Uzumaki", email: "naruto@hokage.com" },
  { name: "Spike Spiegel", email: "spike@bebop.com" },
  { name: "Gon Freecss", email: "gon@hunt.com" },
  { name: "Kaneki Ken", email: "kaneki@ghoul.com" }
]

# Create 10 posts with quotes
quotes = [
  "The world isn’t perfect. But it’s there for us, doing the best it can. That’s what makes it so damn beautiful.",
  "I will always love you, no matter which what time, or where I am. I’ll say it one more time. I love you.",
  "I’ll leave tomorrow’s problems to tomorrow’s me.",
  "I, Lelouch vi Britannia, command you!",
  "I'm going to be the Pirate King!",
  "A lesson without pain is meaningless. For you cannot gain something without sacrificing something else in return.",
  "I'm not gonna run away, I never go back on my word! That's my nindo: my ninja way!",
  "I'm not going there to die. I'm going to find out if I'm really alive.",
  "If you want to get to know someone, find out what makes them angry.",
  "It's not the world that's messed up; it's those of us in it."
]

# Create 10 comments
comments = [
  "This comment was made by Roy Mustang (Full Metal Alchemist)",
  "This comment was made by Okabe (Steins; Gate)",
  "This comment was made by Saitama (One-Punch Man)",
  "This comment was made by Lelouch Lamperouge (Code Geass)",
  "This comment was made by Monkey D. Luffy (One Piece)",
  "This comment was made by Edward Elric (Full Metal Alchemist)",
  "This comment was made by Naruto Uzumaki (Naruto)",
  "This comment was made by Spike Spiegel (Cowboy Bebop)",
  "This comment was made by Gon Freecss (Hunter x Hunter)",
  "This comment was made by Kaneki Ken (Tokyo Ghoul)"
]

tenants = [
  {
    identifier: "kurustudio",
    password: "kurustudio",
    api_key: "kurustudio",
    allowed_domains: ["kuru.studio", "server.kuru.studio", "social.kuru.studio"],
    included_features: ["shop"],
    firebase: {
      project_id: "kuru-studio-social-firebase-dv"
    }
  },
  {
    identifier: "purrintables",
    password: "purrintables",
    allowed_domains: ["purrintables.com"],
    included_features: ["shop"],
    firebase: {
      project_id: "purrintables-firebase-dv"
    }
  },
  {
    identifier: "boseriko",
    password: "boseriko",
    allowed_domains: ["boseriko.com"],
    included_features: ["shop"],
    firebase: {
      project_id: "boseriko-firebase-dv"
    }
  },
]

# Create tenants
tenants.each_with_index do |tenant_params, index|
  firebase_params = tenant_params.delete(:firebase)
  tenant = Tenant.new(tenant_params)
  tenant.save!
  tenant.create_firebase(firebase_params)
end

# Create users and posts
users.each_with_index do |user, index|
  tenant = Tenant.find_by(api_key: "kurustudio")
  created_user = User.new(user)
  created_user.tenant_id = tenant.id
  created_user.save
  created_post = Post.create(content: quotes[index], user_id: created_user.id, tenant_id: tenant.id)
  Comment.create(commentable: created_post, body: comments[index], user_id: created_user.id, tenant_id: tenant.id)
end
