# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
Sitter.create([{name: 'Letícia', address: 'Rua General Lima e Silva, 500 - Centro Histórico, Porto Alegre - RS',
                latitude: -30.0376441, longitude: -51.2222909, photo: 'sitter1', header_background: 'header_background_1'},
               {name: 'Ezequiel', address: 'R. Cel. Genuino, 149 - Centro Histórico, Porto Alegre - Rio Grande do Sul',
                latitude: -30.035148, longitude: -51.2267789, photo: 'sitter2', header_background: 'header_background_2'},
               {name: 'Matheus', address: 'Rua João Alfredo, 400 - Cidade Baixa, Porto Alegre - RS',
                latitude: -30.0406009, longitude: -51.2255778, photo: 'sitter3', header_background: 'header_background_3'},
               {name: 'Lúcia', address: 'Rua da República, 199 - Cidade Baixa, Porto Alegre - RS',
                latitude: -30.0375021, longitude: -51.22195079999999, photo: 'sitter4', header_background: 'header_background_4'}])
