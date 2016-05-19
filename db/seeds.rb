# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

animals = Animal.create([{name: 'Cão'}, {name: 'Gato'}, {name: 'Tartaruga'}, {name: 'Peixe'},
                         {name: 'Pássaro'}, {name: 'Coelho'}, {name: 'Hamster'},
                         {name: 'Porquinho da Índia'}])

cares = Care.create([{name: 'Passeio'}, {name: 'Corte de Unhas'}, {name: 'Aplica Medicação'},
                     {name: 'Massagem'}])

about_me_text = 'Lorem Ipsum é simplesmente uma simulação de texto da indústria tipográfica e de impressos, e vem sendo utilizado desde o século XVI, quando um impressor desconhecido pegou uma bandeja de tipos e os embaralhou para fazer um livro de modelos de tipos. Lorem Ipsum sobreviveu não só a cinco séculos, como também ao salto para a editoração eletrônica, permanecendo essencialmente inalterado. Se popularizou na década de 60, quando a Letraset lançou decalques contendo passagens de Lorem Ipsum, e mais recentemente quando passou a ser integrado a softwares de editoração eletrônica como Aldus PageMaker.'

Sitter.create([{name: 'Letícia', address: 'Rua General Lima e Silva, 500 - Centro Histórico, Porto Alegre - RS',
                district: 'Centro Histórico', value_hour: 30.0,
                about_me: about_me_text, phone: '9856-7412',
                latitude: -30.0376441, longitude: -51.2222909,
                animals: [animals[1]], cares: [cares[0], cares[1]]},
               {name: 'Márcio Lopes', address: 'R. Cel. Genuino, 149 - Centro Histórico, Porto Alegre - Rio Grande do Sul',
                district: 'Centro Histórico', value_hour: 15.0,
                about_me: about_me_text, phone: '9856-6644',
                latitude: -30.035148, longitude: -51.2267789,
                animals: [animals[0], animals[3]], cares: [cares[0], cares[1]]},
               {name: 'Matheus', address: 'Rua João Alfredo, 400 - Cidade Baixa, Porto Alegre - RS',
                district: 'Cidade Baixa', value_hour: 45.0,
                about_me: about_me_text, phone: '9856-2222',
                latitude: -30.0406009, longitude: -51.2255778,
                animals: [animals[0]], cares: [cares[0], cares[1]]},
               {name: 'Lúcia', address: 'Rua da República, 199 - Cidade Baixa, Porto Alegre - RS',
                district: 'Cidade Baixa', value_hour: 25.0,
                about_me: about_me_text, phone: '9856-6666',
                latitude: -30.0375021, longitude: -51.22195079999999,
                animals: [animals[1]], cares: [cares[0], cares[1]]}])

PetOwner.create(name: 'Ezequiel Guilherme', district: 'Centro Histórico', address: 'R. Cel. Genuino, 149 - Centro Histórico, Porto Alegre - Rio Grande do Sul', latitude: -30.035148, longitude: -51.2267789)

Pet.create([{app_id: 'sosudoasiudoauneqw', name: 'Rex', animal: animals[0], pet_owner: PetOwner.first, age: 2, size: 'grande', weight: 25.300, breed: 'SRD',
             pet_cares_attributes: [{care: 'Longos passeios'}, {care: 'Ração Especial'}]},
            {app_id: 'ooi-asdkja-weqwbnb',name: 'Felix', animal: animals[1], pet_owner: PetOwner.first, age: 7, size: 'pequeno', weight: 4.5, breed: 'Siamês',},
            pet_cares_attributes: [{care: ''}, {care: 'Ração Especial'}]])

User.create({email: "leticia@gmail.com", password: "123", entity_type: 'Sitter', entity_id: Sitter.find_by_name('Letícia').id, device_token: nil})
User.create({email: "marciolopes@gmail.com", password: "123", entity_type: 'Sitter', entity_id: Sitter.find_by_name('Márcio Lopes').id, device_token: nil})
User.create({email: "matheus@gmail.com", password: "123", entity_type: 'Sitter', entity_id: Sitter.find_by_name('Matheus').id, device_token: nil})
User.create({email: "lucia@gmail.com", password: "123", entity_type: 'Sitter', entity_id: Sitter.find_by_name('Lúcia').id, device_token: nil})
User.create({email: "zekisan88@gmail.com", password: "123", entity_type: 'Owner', entity_id: PetOwner.find_by_name('Ezequiel Guilherme').id, device_token: nil})
