User.create!(name: "Artem Kulakov",
             email: "artem.kulakov@gmail.com",
             password: "has1any2one3",
             password_confirmation: "has1any2one3",
             admin:     true,
             activated: true,
             activated_at: Time.zone.now)

# Sample users
99.times do |n|
  name  = Faker::Name.name
  email = "example-#{n+1}@railstutorial.org"
  password = "password"
  User.create!(name:  name,
               email: email,
               password:              password,
               password_confirmation: password,
               activated: true,
               activated_at: Time.zone.now)
end

# Sample topics
users = User.order(:created_at).take(6)
50.times do
  # content = Faker::Lorem.sentence(5)
  users.each { |user| user.topics.create!(title: Faker::Lorem.sentence(5), content: Faker::Lorem.sentence(20)) }
end

Industry.create([{ title: 'Oil and gas' },
                { title: 'Metals and mining' }])

Company.create([{ title: 'Gazprom', industry_id: 1, country: 'RU' },
                { title: 'Novatek', industry_id: 1, country: 'RU' },
                { title: 'MMK', industry_id: 2, country: 'RU' },
                { title: 'Severstal', industry_id: 2, country: 'RU' },
                { title: 'Exxon Mobil', industry_id: 1, country: 'US' },
                { title: 'Alcoa', industry_id: 2, country: 'US' }])

Period.create([{ title: '2014', day_id: 1 },
                { title: '2013', day_id: 2 }])

Day.create([{ day: '2014-12-31' },
            { day: '2013-12-31' }])

Indicator.create([{ title: 'Revenues', industry_id: 0 },
                  { title: 'Net income', industry_id: 0 }])

AccountingStandard.create([{ title: 'IFRS' },
                          { title: 'US GAAP' },
                          { title: 'Local GAAP' }])


# # List of currencies
require 'open-uri'
string = open('https://openexchangerates.org/api/currencies.json', {ssl_verify_mode: OpenSSL::SSL::VERIFY_NONE}).read
hash = JSON.parse string
hash.each do |item|
foo = Currency.new
foo.code = item.first
foo.title = item.last
foo.save
end


# Save json with FX rates to file
# string = open('https://openexchangerates.org/api/historical/2014-12-31.json?app_id=5b50e8cb7f9346a885b00d1a274b2b89', {ssl_verify_mode: OpenSSL::SSL::VERIFY_NONE}).read
# File.open("/home/rtmklkv/apps/benchmark/test.json", "w") { |file| file.write string }


# Get currencies' IDs
ids = Hash[Currency.all.pluck(:code, :id)]

# Read JSON
string = open(Rails.root + 'test.json').read
json = JSON.parse string

# Get day
bar = Day.find(1)

# Create rates
json['rates'].each do |code, rate|
  foo = bar.fx_rates.new
  foo.currency_id = ids[code]
  foo.rate = rate
end

# Save day and rates
bar.save




# cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
# Mayor.create(name: 'Emanuel', city: cities.first)
