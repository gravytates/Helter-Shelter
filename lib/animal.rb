class Animal
  attr_accessor(:name, :date_in, :species, :breed, :gender, :age, :id)

  def initialize(attributes)
    @name = attributes.fetch(:name)
    @date_in = attributes.fetch(:date_in)
    @species = attributes.fetch(:species)
    @breed = attributes.fetch(:breed)
    @gender = attributes.fetch(:gender)
    @age = attributes.fetch(:age)
    @id = attributes.fetch(:id)
  end

  def save
    DB.exec("INSERT INTO animals (name, date_in, species, breed, gender, age, id) VALUES ('#{@name}', '#{@date_in}', '#{@species}', '#{@breed}', '#{@gender}', '#{@age}', #{@id});")
  end

  def Animal.all
    returned_animals = DB.exec("SELECT * FROM animals;")
    animals = []
    returned_animals.each do |animal|
      name = animal.fetch("name")
      date_in = animal.fetch("date_in")
      species = animal.fetch("species")
      breed = animal.fetch("breed")
      gender = animal.fetch("gender")
      age = animal.fetch("age")
      id = animal.fetch("id").to_i
      animals.push(Animal.new({:name => name, :date_in => date_in, :species => species, :breed => breed, :gender => gender, :age => age, :id => id}))
    end
    animals
  end

  def == (another_animal)
    self.name().==(another_animal.name()).&(self.date_in().==(another_animal.date_in())).&(self.species().==(another_animal.species())).&(self.breed().==(another_animal.breed())).&(self.gender().==(another_animal.gender())).&(self.age().==(another_animal.age()))
  end
end
