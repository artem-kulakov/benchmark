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
15.times do
  # content = Faker::Lorem.sentence(5)
  users.each { |user| user.topics.create!(title: Faker::Lorem.sentence(5), content: Faker::Lorem.sentence(20)) }
end


# Sample posts
topics = Topic.all
3.times do
  topics.each do |topic|
    users.each do |user|
      topic.posts.create!(content: Faker::Lorem.sentence(20), user_id: user.id)
    end
  end
end


# Industries
industries = ['Oil and gas',
             'Metails and mining',
             'Retail']
industries.each do |industry|
  Industry.create(title: industry)
end


# Companies
10.times do
  (1..3).each do |industry|
    ['RU', 'US'].each do |country|
      Company.create(title: Faker::Company.name, industry_id: industry, country: country)
    end
  end
end


# Reports
(1..60).each do |company|
  (1..2).each do |period|
    report = Report.create(company_id: company, period_id: period, accounting_standard_id: 1, maker_id: 1)
    report.values.create(indicator_id: 1, value: rand(1000..2000), currency_id: 152) 
    report.values.create(indicator_id: 2, value: rand(100..200), currency_id: 152) 
  end
end


# Periods
Period.create([{ title: '2014', day_id: 1 },
                { title: '2013', day_id: 2 }])


# Days
Day.create([{ day: '2014-12-31' },
            { day: '2013-12-31' }])


# Indicators
Indicator.create([{ title: 'Revenues', industry_id: 0 },
                  { title: 'Net income', industry_id: 0 }])


# GAAPs
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
