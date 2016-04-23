# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

User.create({name: "Letícia", email: "leticia@gmail.com", photo: "sitter1", logged: false, category: 1})
User.create({name: "Márcio Lopes", email: "marciolopes@gmail.com", photo: "sitter2", logged: true, category: 1})
User.create({name: "Matheus", email: "matheus@gmail.com", photo: "sitter3", logged: false, category: 1})
User.create({name: "Lúcia", email: "lucia@gmail.com", photo: "sitter4", logged: false, category: 1})
User.create({name: "Ezequiel Guilherme", email: "zekisan88@gmail.com", photo: "me", logged: true, category: 0})

animals = Animal.create([{name: 'Cão'}, {name: 'Gato'}, {name: 'Tartaruga'}, {name: 'Peixe'},
                         {name: 'Pássaro'}, {name: 'Coelho'}, {name: 'Hamster'},
                         {name: 'Porquinho da Índia'}])

cares = Care.create([{name: 'Passeio'}, {name: 'Corte de Unhas'}, {name: 'Aplica Medicação'},
                     {name: 'Massagem'}])

Sitter.create([{name: 'Letícia', address: 'Rua General Lima e Silva, 500 - Centro Histórico, Porto Alegre - RS',
                district: 'Centro Histórico', value_hour: 0.0, value_shift: 45.0, value_day: 150.0, user: User.find(1),
                about_me: 'Lorem Ipsum é simplesmente uma simulação de texto da indústria tipográfica e de impressos, e vem sendo utilizado desde o século XVI, quando um impressor desconhecido pegou uma bandeja de tipos e os embaralhou para fazer um livro de modelos de tipos. Lorem Ipsum sobreviveu não só a cinco séculos, como também ao salto para a editoração eletrônica, permanecendo essencialmente inalterado. Se popularizou na década de 60, quando a Letraset lançou decalques contendo passagens de Lorem Ipsum, e mais recentemente quando passou a ser integrado a softwares de editoração eletrônica como Aldus PageMaker.',
                latitude: -30.0376441, longitude: -51.2222909, photo: 'sitter1', header_background: 'header_background_1',
                animals: [animals[1]], cares: [cares[0], cares[1]]},
               {name: 'Márcio Lopes', address: 'R. Cel. Genuino, 149 - Centro Histórico, Porto Alegre - Rio Grande do Sul',
                district: 'Centro Histórico', value_hour: 15.0, value_shift: 60.0, value_day: 175.0, user: User.find(2),
                about_me: 'Lorem Ipsum é simplesmente uma simulação de texto da indústria tipográfica e de impressos, e vem sendo utilizado desde o século XVI, quando um impressor desconhecido pegou uma bandeja de tipos e os embaralhou para fazer um livro de modelos de tipos. Lorem Ipsum sobreviveu não só a cinco séculos, como também ao salto para a editoração eletrônica, permanecendo essencialmente inalterado. Se popularizou na década de 60, quando a Letraset lançou decalques contendo passagens de Lorem Ipsum, e mais recentemente quando passou a ser integrado a softwares de editoração eletrônica como Aldus PageMaker.',
                latitude: -30.035148, longitude: -51.2267789, photo: 'sitter2', header_background: 'header_background_2',
                animals: [animals[0], animals[3]], cares: [cares[0], cares[1]]},
               {name: 'Matheus', address: 'Rua João Alfredo, 400 - Cidade Baixa, Porto Alegre - RS',
                district: 'Cidade Baixa', value_hour: 0.0, value_shift: 0.0, value_day: 110.0, user: User.find(3),
                about_me: 'Lorem Ipsum é simplesmente uma simulação de texto da indústria tipográfica e de impressos, e vem sendo utilizado desde o século XVI, quando um impressor desconhecido pegou uma bandeja de tipos e os embaralhou para fazer um livro de modelos de tipos. Lorem Ipsum sobreviveu não só a cinco séculos, como também ao salto para a editoração eletrônica, permanecendo essencialmente inalterado. Se popularizou na década de 60, quando a Letraset lançou decalques contendo passagens de Lorem Ipsum, e mais recentemente quando passou a ser integrado a softwares de editoração eletrônica como Aldus PageMaker.',
                latitude: -30.0406009, longitude: -51.2255778, photo: 'sitter3', header_background: 'header_background_3',
                animals: [animals[0]], cares: [cares[0], cares[1]]},
               {name: 'Lúcia', address: 'Rua da República, 199 - Cidade Baixa, Porto Alegre - RS',
                district: 'Cidade Baixa', value_hour: 25.0, value_shift: 50.0, value_day: 130.0, user: User.find(4),
                about_me: 'Lorem Ipsum é simplesmente uma simulação de texto da indústria tipográfica e de impressos, e vem sendo utilizado desde o século XVI, quando um impressor desconhecido pegou uma bandeja de tipos e os embaralhou para fazer um livro de modelos de tipos. Lorem Ipsum sobreviveu não só a cinco séculos, como também ao salto para a editoração eletrônica, permanecendo essencialmente inalterado. Se popularizou na década de 60, quando a Letraset lançou decalques contendo passagens de Lorem Ipsum, e mais recentemente quando passou a ser integrado a softwares de editoração eletrônica como Aldus PageMaker.',
                latitude: -30.0375021, longitude: -51.22195079999999, photo: 'sitter4', header_background: 'header_background_4',
                animals: [animals[1]], cares: [cares[0], cares[1]]}])

PetOwner.create(name: 'Ezequiel Guilherme', district: 'Centro Histórico', address: 'R. Cel. Genuino, 149 - Centro Histórico, Porto Alegre - Rio Grande do Sul', latitude: -30.035148, longitude: -51.2267789, photo: 'me', user: User.find(5))

