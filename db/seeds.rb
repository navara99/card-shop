# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

puts "Seeding Data ..."

# Helper functions
def open_asset(file_name)
  File.open(Rails.root.join('db', 'seed_assets', file_name))
end

# Only run on development (local) instances not on production, etc.
unless Rails.env.development?
  puts "Development seeds only (for now)!"
  exit 0
end

# Let's do this ...

## CATEGORIES

puts "Finding or Creating Categories ..."

# cat1 = Category.find_or_create_by! name: 'Apparel'
# cat2 = Category.find_or_create_by! name: 'Electronics'
# cat3 = Category.find_or_create_by! name: 'Furniture'
cat1 = Category.find_or_create_by! name: 'Pokemon'
cat2 = Category.find_or_create_by! name: 'Yu-Gi-Oh'
cat3 = Category.find_or_create_by! name: 'Magic The Gathering'
cat4 = Category.find_or_create_by! name: 'Basketball'
cat5 = Category.find_or_create_by! name: 'Baseball'

## PRODUCTS

puts "Re-creating Products ..."

Product.destroy_all

cat1.products.create!({
  name:  'Alakazam - 1/102 - Holo Rare - Shadowless Edition',
  description: Faker::Hipster.paragraph(4),
  image: open_asset('alakazam.jpg'),
  quantity: 10,
  price: 60.99
});

cat1.products.create!({
  name:  'Poliwrath - 13/102 - Holo Rare - 1st Edition',
  description: Faker::Hipster.paragraph(4),
  image: open_asset('poliwrath.jpg'),
  quantity: 7,
  price: 400.99
});

cat1.products.create!({
  name:  'Machamp - 8/102 - Holo Rare - 1st Edition - SHADOWLESS Edition',
  description: Faker::Hipster.paragraph(4),
  image: open_asset('machamp.jpg'),
  quantity: 5,
  price: 30.99
});

cat5.products.create!({
  name:  '2018 Topps Big League Baseball Hobby Box',
  description: Faker::Hipster.paragraph(4),
  image: open_asset('big-league-box.jpg'),
  quantity: 2,
  price: 29.99
});

cat2.products.create!({
  name:  'Rocket Warrior - CT2-EN005 - Secret Rare - Limited Edition',
  description: Faker::Hipster.paragraph(4),
  image: open_asset('rocketwarrior.jpg'),
  quantity: 12,
  price: 3.99
});

cat2.products.create!({
  name:  'Cyber Dragon - CT03-EN002 - Secret Rare - Limited Edition',
  description: Faker::Hipster.paragraph(4),
  image: open_asset('cyberdragon.jpg'),
  quantity: 12,
  price: 5.49
});

cat2.products.create!({
  name:  'Elemental Hero Shining Flare Wingman - CT03-EN004 - Secret Rare - Limited Edition',
  description: Faker::Hipster.paragraph(4),
  image: open_asset('elementalhero.jpg'),
  quantity: 0,
  price: 5.99
});

cat2.products.create!({
  name:  'Rainbow Dragon - CT04-EN005 - Secret Rare - Limited Edition',
  description: Faker::Hipster.paragraph(4),
  image: open_asset('rainbowdragon.jpg'),
  quantity: 12,
  price: 8.99
});

cat1.products.create!({
  name:  'Dragonair - 18/102 - Rare - 1st Edition',
  description: Faker::Hipster.paragraph(4),
  image: open_asset('dragonair.jpg'),
  quantity: 2,
  price: 500.99
});

cat3.products.create!({
  name:  'Liliana, Dreadhorde General - Promo Pack',
  description: Faker::Hipster.paragraph(4),
  image: open_asset('liliana.jpg'),
  quantity: 9,
  price: 29.99
});

cat3.products.create!({
  name:  'Teferi, Time Raveler',
  description: Faker::Hipster.paragraph(4),
  image: open_asset('teferi.png'),
  quantity: 4,
  price: 21.99
});

cat4.products.create!({
  name:  '2015-16 Panini Prestige NBA Basketball HANGER Box',
  description: Faker::Hipster.paragraph(4),
  image: open_asset('prestige.jpg'),
  quantity: 8,
  price: 64.99
});

cat4.products.create!({
  name:  '2021-22 Panini HOOPS NBA Basketball Hobby Box',
  description: Faker::Hipster.paragraph(4),
  image: open_asset('21-hobby-box.jpg'),
  quantity: 3,
  price: 209.99
});

cat3.products.create!({
  name:  'Finale of Devastation',
  description: Faker::Hipster.paragraph(4),
  image: open_asset('finale.png'),
  quantity: 0,
  price: 39.99
});

cat4.products.create!({
  name:  '2021-22 Panini HOOPS NBA Basketball Hobby Box',
  description: Faker::Hipster.paragraph(4),
  image: open_asset('17-hobby-box.jpg'),
  quantity: 2,
  price: 219.99
});

cat1.products.create!({
  name:  'Magikarp - 35/102 - Uncommon - Shadowless Edition',
  description: Faker::Hipster.paragraph(4),
  image: open_asset('magikarp.jpg'),
  quantity: 0,
  price: 10.99
});

cat2.products.create!({
  name:  'Blue-Eyes Alternative Ultimate Dragon - TN19-EN001 - Prismatic Secret Rare - Limited Edition',
  description: Faker::Hipster.paragraph(4),
  image: open_asset('blueeyes.png'),
  quantity: 3,
  price: 5.49
});

cat5.products.create!({
  name:  '2021 Panini Mosaic CHOICE Baseball Hobby Box',
  description: Faker::Hipster.paragraph(4),
  image: open_asset('21base.jpg'),
  quantity: 3,
  price: 89.99
});

cat1.products.create!({
  name:  'Mewtwo - 10/102 - Holo Rare - Shadowless Edition',
  description: Faker::Hipster.paragraph(4),
  image: open_asset('mewtwo.jpg'),
  quantity: 1,
  price: 95.99
});

cat2.products.create!({
  name:  'Dark Magician - BPT-007 - Secret Rare',
  description: Faker::Hipster.paragraph(4),
  image: open_asset('darkmagician.jpg'),
  quantity: 12,
  price: 27.99
});

puts "DONE!"
