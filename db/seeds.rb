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
  print "|"
end
puts ""

puts "Creating Organization"
puts "========================================================="
50.times do
  name = Faker::Name.name.split
  Organization.create!(
    name: Faker::Company.name,
    phone: Faker::PhoneNumber.phone_number,
    address_line1: Faker::Address.street_address,
    address_line2: nil,
    postal_code: Faker::Address.zip_code,
    city: Faker::Address.city,
    province: Faker::Address.state,
    phone: Faker::PhoneNumber.phone_number,
    user_id: User.all.sample.id,
    image: nil
  )
  print "|"
end
puts ""

puts "Creating Providers"
puts "========================================================="
100.times do
  name = Faker::Name.name.split
  kind = %w[Doctor Counsellor Surgeon].sample
  Provider.create!(
    first_name: name.first,
    last_name: name.last,
    kind: kind,
    organization_id: Organization.all.sample.id,
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
  print "|"
end
puts ""

puts "Creating Reviews"
puts "========================================================="
150.times do
  reviewer_user = User.all.sample
  r = Review.create!(
    comment: Faker::Lorem.paragraph,
    user_id: User.all.sample.id,
    provider_id: Provider.all.sample.id,
    organization_id: Organization.all.sample.id,
    name: reviewer_user.user_name,
    email: reviewer_user.email
    )
  print "|"
end
puts ""

puts "Creating Ratings"
puts "========================================================="
150.times do
  r = Rating.create!(
    user_id: User.all.sample.id,
    provider_id: Provider.all.sample.id,
    organization_id: Organization.all.sample.id,
    knowledge: [*0..4].sample,
    support: [*0..4].sample,
    comfort: [*0..4].sample,
    accessibility: [*0..4].sample,
    recommendation: [*0..4].sample
  )
  print "|"
end
puts ""
