puts "Creating Admin"
puts "========================================================="
User.create!(
  first_name: "admin",
  last_name: "admin",
  user_name: "admin",
  email: "admin@example.com",
  password: "asdf;lkj",
  password_confirmation: "asdf;lkj"
)

puts "Creating Users"
puts "========================================================="
100.times do
  name = Faker::Name.name.split
  User.create!(
    first_name: name.first,
    last_name: name.last,
    user_name: name.join(" ").parameterize,
    email: name.join(" ").parameterize.gsub("-", "_") + "@gmail.com",
    password: "asdf;lkj",
    password_confirmation: "asdf;lkj"
  )
end

puts "Creating Providers"
puts "========================================================="
100.times do
  name = Faker::Name.name.split
  kind = %w[Doctor, Counsellor, Organization, Surgeon].sample
  Provider.create!(
    first_name: (name.first unless kind == "Organization"),
    last_name: (name.last unless kind == "Organization"),
    kind: kind,
    organization_name: (Faker::Company.name if kind == "Organization"),
    phone: Faker::PhoneNumber.phone_number,
    address_line1: Faker::Address.street_address,
    address_line2: nil,
    postal_code: Faker::Address.zip_code,
    city: Faker::Address.city,
    province: Faker::Address.state,
    phone: Faker::PhoneNumber.phone_number,
    waiting_period: [*1..10].sample,
    user_id: User.all.sample.id,
    image: nil
  )
nd

puts "Creating Reviews"
puts "========================================================="
150.times do
  reviewer_user = User.all.sample
  r = Review.create!(
    comment: Faker::Lorem.paragraph,
    user_id: User.all.sample.id,
    provider_id: Provider.all.sample.id,
    name: reviewer_user.user_name,
    email: reviewer_user.email
    )
end

puts "Creating Ratings"
puts "========================================================="
150.times do
  r = Rating.create!(
    user_id: User.all.sample.id,
    provider_id: Provider.all.sample.id,
    knowledge: [*0..4].sample,
    support: [*0..4].sample,
    comfort: [*0..4].sample,
    accessibility: [*0..4].sample,
    recommendation: [*0..4].sample
  )
end