# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Municipality.create([{ municipality: 'medellin' }, 
  { municipality: 'bello' },
  { municipality: 'envigado' },
  { municipality: 'itagüi' },
  { municipality: 'sabaneta' },
  { municipality: 'barbosa' },
  { municipality: 'caldas' },
  { municipality: 'la_estrella' },
  { municipality: 'girardota' },
  { municipality: 'copacabana' }]) if Municipality.all.empty?