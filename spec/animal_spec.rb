require "spec_helper"

describe(Animal) do
  describe('.all') do
    it("is empty at first") do
      expect(Animal.all()).to(eq([]))
    end
  end

  describe("#initialize") do
    it("lets you read the description out") do
      test_animal = Animal.new({:name => "Sparky", :date_in => "2017-05-02", :species => 'dog', :breed => 'dalmatian', :gender => 'male', :age => "3", :family_id => 1, :id => 1})
      expect(test_animal.name()).to(eq("Sparky"))
    end
  end

  describe("#initialize") do
    it("lets you read the due date out") do
    test_animal = Animal.new({:name => "Sparky", :date_in => "2017-05-02", :species => 'dog', :breed => 'dalmatian', :gender => 'male', :age => "3", :family_id => 1, :id => 1})
      expect(test_animal.date_in).to(eq("2017-05-02"))
    end
  end


  describe("#==") do
    it("is the same task if it has the same description") do
      animal1 = Animal.new({:name => "Sparky", :date_in => "2017-05-02", :species => 'dog', :breed => 'dalmatian', :gender => 'male', :age => "3", :family_id => 1, :id => 1})
      animal2 = Animal.new({:name => "Sparky", :date_in => "2017-05-02", :species => 'dog', :breed => 'dalmatian', :gender => 'male', :age => "3", :family_id => 2, :id => 2})

      expect(animal1).to(eq(animal2))
    end
  end

  describe("#save") do
    it("adds a animal to the array of saved animals") do
      test_animal = Animal.new({:name => "Sparky", :date_in => "2017-05-02", :species => 'dog', :breed => 'dalmatian', :gender => 'male', :age => "3", :family_id => 1, :id => 1})
      test_animal.save()
      expect(Animal.all).to(eq([test_animal]))
    end
  end
end
