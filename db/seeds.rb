user = User.create(
  email: "dev@dev.com",
  password: "12345678",
)

domain = Domain.create(
  host: "localhost",
  page_title: "Development",
  user: user
)

titles = ["Work", "About", "Inspiration"]
bodies = ["Never", "Five Fingers Five Toes Five Problems", "My Brother"]

3.times do |o|
  Page.create(
    title: titles[o],
    body: bodies[o],
    order: (o + 1),
    domain_id: domain.id,
    url_key: titles[o]
  )
end
