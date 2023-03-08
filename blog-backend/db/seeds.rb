# Seed data for authors
authors = [
  { name: "John Doe", avatar: "/assets/images/author.jpg" },
  { name: "Jane Smith", avatar: "/assets/images/author.jpg" },
  { name: "Bob Johnson", avatar: "/assets/images/author.jpg" }
]

Author.create!(authors)

# Seed data for categories
categories = [
  { name: "Technology", subcategories_attributes: [
    { name: "SoftwareEng" },
    { name: "MobileDevs" }
  ]},
  { name: "Sports", subcategories_attributes: [
    { name: "Football" },
    { name: "Basketball" }
  ]},
  { name: "Politics", subcategories_attributes: [
    { name: "WorldNews" },
    { name: "LocalNews" }
  ]}
]

categories.each do |category_attrs|
  subcategories_attrs = category_attrs.delete(:subcategories_attributes)
  category = Category.create!(category_attrs)
  subcategories_attrs.each do |subcat_attrs|
    category.subcategories.create!(subcat_attrs)
  end
end

# Seed data for blogs
blogs = [
  { title: "How to Code in Ruby on Rails", content: "In this tutorial, we'll walk you through the basics of Ruby on Rails development.", cover: "/assets/images/designer-1.jpg", author_id: 1, category_id: 1 },
  { title: "Why LeBron James is the GOAT", content: "LeBron James has dominated the NBA like no other player before him. Here's why he deserves to be called the greatest of all time.", cover: "/assets/images/f67396fc3cfce63a28e07ebb35d974ac.jpg", author_id: 2, category_id: 2 },
  { title: "The Rise of Populism in Europe", content: "As right-wing parties gain power across the continent, we examine the factors driving this trend and its implications for the future of Europe.", cover: "/assets/images/author.jpg", author_id: 3, category_id: 3}
]

Blog.create!(blogs)
