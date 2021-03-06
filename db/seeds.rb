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

Sitter.create([{name: 'Letícia', street: 'Rua General Lima e Silva', address_number: '500',
                city: 'Porto Alegre', state: 'RS', cep: '90050-102', complement: nil, surname: 'Verardi',
                district: 'Centro Histórico', value_hour: 30.0,
                about_me: about_me_text, phone: '9856-7412',
                latitude: -30.0376441, longitude: -51.2222909,
                animals: [animals[1]], cares: [cares[0], cares[1]]},
               {name: 'Márcio',
                street: 'R. Cel. Genuino', address_number: '149', surname: 'Lopes',
                city: 'Porto Alegre', state: 'RS', cep: '90010-350', complement: nil,
                district: 'Centro Histórico', value_hour: 15.0,
                about_me: about_me_text, phone: '9856-6644',
                latitude: -30.035148, longitude: -51.2267789,
                animals: [animals[0], animals[3]], cares: [cares[0], cares[1]]},
               {name: 'Matheus',
                street: 'Rua João Alfredo', address_number: '400', surname: 'Silva',
                city: 'Porto Alegre', state: 'RS', cep: '90050-230', complement: nil,
                district: 'Cidade Baixa', value_hour: 45.0,
                about_me: about_me_text, phone: '9856-2222',
                latitude: -30.0406009, longitude: -51.2255778,
                animals: [animals[0]], cares: [cares[0], cares[1]]},
               {name: 'Lúcia',
                street: 'Rua da República', address_number: '199', surname: 'Mattos',
                city: 'Porto Alegre', state: 'RS', cep: '90050-321', complement: nil,
                district: 'Cidade Baixa', value_hour: 25.0,
                about_me: about_me_text, phone: '9856-6666',
                latitude: -30.0375021, longitude: -51.22195079999999,
                animals: [animals[1]], cares: [cares[0], cares[1]]}])

PetOwner.create(name: 'Ezequiel', district: 'Centro Histórico', surname: 'Guilherme',
                street: 'R. Cel. Genuino', address_number: '149', complement: nil,
                city: 'Porto Alegre', state: 'RS', cep: '90010-350',
                latitude: -30.035148, longitude: -51.2267789)

Pet.create([{app_id: 'sosudoasiudoauneqw', name: 'Rex', animal: animals[0], pet_owner: PetOwner.first, age: 2, size: 'grande', weight: 25.300, breed: 'SRD',
             pet_cares_attributes: [{care: 'Longos passeios'}, {care: 'Ração Especial'}]},
            {app_id: 'ooi-asdkja-weqwbnb',name: 'Felix', animal: animals[1], pet_owner: PetOwner.first, age: 7, size: 'pequeno', weight: 4.5, breed: 'Siamês',},
            pet_cares_attributes: [{care: 'Problemas cardíacos'}, {care: 'Ração Especial'}]])

User.create({email: "leticia@gmail.com", password: "123", entity_type: 'Sitter', entity_id: Sitter.find_by_name('Letícia').id, device_token: nil})
User.create({email: "marciolopes@gmail.com", password: "123", entity_type: 'Sitter', entity_id: Sitter.find_by_name('Márcio Lopes').id, device_token: nil})
User.create({email: "matheus@gmail.com", password: "123", entity_type: 'Sitter', entity_id: Sitter.find_by_name('Matheus').id, device_token: nil})
User.create({email: "lucia@gmail.com", password: "123", entity_type: 'Sitter', entity_id: Sitter.find_by_name('Lúcia').id, device_token: nil})
User.create({email: "zekisan88@gmail.com", password: "123", entity_type: 'Owner', entity_id: PetOwner.find_by_name('Ezequiel Guilherme').id, device_token: nil})
