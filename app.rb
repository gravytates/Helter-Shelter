require 'sinatra'
require 'sinatra/reloader'
require 'pry'
require './lib/animal'
require './lib/family'
require("pg")
also_reload('lib/**/*.rb')

DB = PG.connect({:dbname => "helter_shelter"})


get('/') do
  erb(:index)
end

get('/family_list') do
  @families = Family.all
  erb(:family_list)
end

get('/add/family') do
  erb(:add_family)
end

post('/add/family') do
  name = params.fetch('name')
  phone = params.fetch('phone')
  species_pref = params.fetch('species_pref')
  breed_pref = params.fetch('breed_pref')
  id = nil
  new_family = Family.new({:name => name, :phone => phone, :species_pref => species_pref, :breed_pref => breed_pref, :id => id})
  new_family.save
  @families = Family.all
  erb(:family_list)
end

get('/family/:id') do
  @family = Family.find(params.fetch('id'))
  @animals = Animal.all
# binding.pry
  erb(:family_details)
end

#animals
get('/animal_list') do
  @animals = Animal.all
  erb(:animal_list)
end


get('/add/animal') do
  erb(:add_animal)
end

post('/add/animal') do
  name = params.fetch('name')
  date_in = params.fetch('date_in')
  species = params.fetch('species')
  breed = params.fetch('breed')
  gender = params.fetch('gender')
  age = params.fetch('age')
  id = nil
  family_id = 0
  new_animal = Animal.new({:name => name, :date_in => date_in, :species => species, :breed => breed, :gender => gender, :age => age, :family_id => family_id, :id => id})
  new_animal.save
  @animals = Animal.all
  erb(:animal_list)
end

post('/adopt') do
  # chosen_animal = params.fetch('animal.id')
  # family_id = chosen_animal;
  # result = DB.exec("SELECT * FROM animals WHERE chosen_animal == primary key;")
  # @families = Family.all
  erb(:family_list)
end
