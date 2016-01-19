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

# cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
# Mayor.create(name: 'Emanuel', city: cities.first)
