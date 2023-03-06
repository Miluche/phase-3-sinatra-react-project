puts "🌱 Seeding spices..."

# Seed Authors
author = Author.create(name: "John Doe", avatar: "/assets/images/author.jpg")

# Seed Subcategories
frontend = Subcategory.create(name: "frontend")
ui_ux = Subcategory.create(name: "ui/ux")
design = Subcategory.create(name: "design")
vacation = Subcategory.create(name: "vacation")
holidays = Subcategory.create(name: "holidays")
sight_seeing = Subcategory.create(name: "sight seeing")
e_commerce_store = Subcategory.create(name: "e-commerce store")
clothing = Subcategory.create(name: "clothing")
shopping_store = Subcategory.create(name: "shopping store")
adrenaline = Subcategory.create(name: "adrenaline")
stay_fit = Subcategory.create(name: "stay-fit")
lifestyle = Subcategory.create(name: "lifestyle")
bbq = Subcategory.create(name: "bbq")
food = Subcategory.create(name: "food")
beaches = Subcategory.create(name: "beaches")
sea = Subcategory.create(name: "sea")
skill = Subcategory.create(name: "skill")
passion = Subcategory.create(name: "passion")

# Seed Blogs
Blog.create(
  title: "7 CSS tools you should be using",
  category: "development",
  description: "Lorem Ipsum is simply dummy text of the printing and typesetting industry...",
  author: author,
  subcategories: [frontend, ui_ux, design],
  created_at: "June 03, 2021",
  cover: "/assets/images/designer-1.jpg"
)

Blog.create(
  title: "Milan Places That Highlight The City",
  category: "travel",
  description: "Lorem Ipsum is simply dummy text of the printing and typesetting industry...",
  author: author,
  subcategories: [vacation, holidays, sight_seeing],
  created_at: "June 03, 2021",
  cover: "/assets/images/f67396fc3cfce63a28e07ebb35d974ac.jpg"
)

Blog.create(
  title: "Online Shopping – An Alternative to Shopping in the Mall",
  category: "shopping",
  description: "Lorem Ipsum is simply dummy text of the printing and typesetting industry...",
  author: author,
  subcategories: [e_commerce_store, clothing, shopping_store],
  created_at: "June 03, 2021",
  cover: "/assets/images/fQwuyKJ9qxjSbr6REcgtmW-1200-80.jpg"
)

Blog.create(
  title: "ADVENTURE IN YOU",
  category: "adventure",
  description: "Lorem Ipsum is simply dummy text of the printing and typesetting industry...",
  author: author,
  subcategories: [adrenaline, stay_fit, lifestyle],
  created_at: "June 03, 2021",
  cover: "/assets/images/graphic-design-trends.png"
)

Blog.create(
  title: "Loaded BBQ Baked Potatoes",
  category: "cooking",
  description: "Lorem Ipsum is simply dummy text of the printing and typesetting industry...",
  author: author,
  subcategories: [bbq, food, lifestyle],
  created_at: "June 03, 2021",
  cover: "/assets/images/make-it-personal.jpg"
)

Blog.create(
  title: "Beyond the Beach",
  category: "travel",
  description: "Lorem Ipsum is simply dummy text of the printing and typesetting industry...",
  author: author,
  subcategories: [beaches, sea, holidays],
  created_at: "June 03, 2021",
  cover: "/assets/images/author.jpg"
)

Blog.create(
  title: "Art & Perception",
  category: "art",
  description: "Lorem Ipsum is simply dummy text of the printing and typesetting industry...",
  author: author,
  subcategories: [skill, design, passion],
  created_at: "June 03, 2021",
  cover: "/assets/images/Synthwave-Postmodern.jpg"
)

  puts "✅ Done seeding!"
