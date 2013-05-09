# encoding: utf-8

# User
User.create(
  email:    'admin@garsdunordbergerac.org',
  password: 'password'
)

# Contact
[
  { name: 'Vintaer Bernard',    email: 'bernard.vintaer@sfr.fr', position: 'Président' },
  { name: 'Karsenti Jean-Paul', email: 'jplil4549@yahoo.fr',     position: 'Secrétaire' },
  { name: 'Licour Michel',      email: 'michel.licour@free.fr',  position: 'Trésorier' }
].each { |params| Contact.create(params) }

# Content
[
  { code: 'presentation', content: '' }
].each { |params| Content.create(params) }

# Event
[
  { title: 'La galette des rois', begin_at: Date.new(2013, 1, 27), place: 'salle des fêtes de PRIGONRIEUX', album_title: 'galette-des-rois-2013', description: 'resque tout le monde connaît l\'Epiphanie, et les galettes des rois. C\'est donc en Janvier, qu\'après un repas, nous mangeons des galettes. Mais bien sur, nous ne faisons pas que manger des galettes ! D\'ailleurs, lors de la galette de la galette des rois 2009, nous avions fait venir un groupe de "Country", qui en plus de nous montrer un bien beau spectacle, nous avaient aussi appris quelques pas de leur danse.' },
  { title: 'Soirée Music-Hall', begin_at: Date.new(2013, 2, 23), place: 'Bergerac', description: '' },
  { title: 'Quine', begin_at: Date.new(2013, 3, 16), place: 'salle des fêtes de PRIGONRIEUX', description: '' },
  { title: 'Pique-Nique Pétanque', begin_at: Date.new(2013, 6, 23), place: 'QUEYSSAC', description: '' },
  { title: 'Moules-Frites Brocantes', begin_at: Date.new(2013, 9, 8), place: 'salle des fêtes de PRIGONRIEUX', description: '' },
  { title: 'Forum des associations', begin_at: Date.new(2013, 9, 21), end_at: Date.new(2013, 9, 22), place: 'salle Anatole France', description: '' },
  { title: 'Quine', begin_at: Date.new(2013, 11, 17), place: 'salle Louis Delluc de Bergerac', description: '' },
  { title: 'Saint Nicolas', begin_at: Date.new(2013, 12, 15), place: 'salle des fêtes de PRIGONRIEUX', description: '' },
  { title: 'Assemblée générale Galette des rois', begin_at: Date.new(2014, 1, 26), place: 'salle Louis Delluc de Bergerac', description: '' }
].each { |params| Event.create(params) }

# Summary
[
  { title: 'Loto', happened_at: Date.new(2013, 3, 16), document_url: 'https://docs.google.com/file/d/0B0EaiD90Vpj0ckRPSzVOTGd0dFU/edit?usp=sharing' },
  { title: 'Compte rendu de réunion', happened_at: Date.new(2013, 1, 7), document_url: 'https://docs.google.com/file/d/0B0EaiD90Vpj0elZfTXNKRVpQM0U/edit?usp=sharing' }
].each { |params| Summary.create(params) }
