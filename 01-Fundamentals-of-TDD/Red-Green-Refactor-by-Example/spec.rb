# Use TDD principles to build out name functionality for a Person.
# Here are the requirements:
# - Add a method to return the full name as a string. A full name includes
#   first, middle, and last name. If the middle name is missing, there shouldn't
#   have extra spaces.
# - Add a method to return a full name with a middle initial. If the middle name
#   is missing, there shouldn't be extra spaces or a period.
# - Add a method to return all initials. If the middle name is missing, the
#   initials should only have two characters.
#
# We've already sketched out the spec descriptions for the #full_name. Try
# building the specs for that method, watch them fail, then write the code to
# make them pass. Then move on to the other two methods, but this time you'll
# create the descriptions to match the requirements above.

class Person
  attr_reader :first_name, :middle_name, :last_name

  def initialize(first_name:, middle_name: nil, last_name:)
    @first_name = first_name
    @middle_name = middle_name
    @last_name = last_name
  end

  # implement your behavior here
  def full_name
    if @middle_name == nil
      return "#{@first_name} #{@last_name}"
    end
    "#{@first_name} #{@middle_name} #{@last_name}"
  end

  def full_name_with_middle_initial
    if @middle_name == nil
      return "#{@first_name} #{@last_name}"
    end
    "#{@first_name} #{@middle_name[0]}. #{@last_name}"
  end

  def initials
    if @middle_name == nil
      return "#{@first_name[0]}.#{@last_name[0]}."
    end
    "#{@first_name[0]}.#{@middle_name[0]}.#{@last_name[0]}."
  end
end

RSpec.describe Person do
  describe "#full_name" do
    it "should concatenate first name, middle name, and last name with spaces" do
      person = Person.new(first_name: 'Dwight', middle_name: 'David', last_name: 'Eisenhower')
      expect(person.full_name).to eq('Dwight David Eisenhower')
    end

    it "should not add extra spaces if middle name is missing" do
      person = Person.new(first_name:'Dwight', last_name: 'Eisenhower')
      expect(person.full_name).to eq('Dwight Eisenhower')
    end
  end

  describe "#full_name_with_middle_initial" do
    it "should return a full name with a middle initial" do
      person = Person.new(first_name: 'Dwight', middle_name: 'David', last_name: 'Eisenhower')
      expect(person.full_name_with_middle_initial).to eq('Dwight D. Eisenhower')
    end

    it "shouldn't be extra spaces or a period if the middle name is missing" do 
      person = Person.new(first_name:'Dwight', last_name: 'Eisenhower')
      expect(person.full_name_with_middle_initial).to eq('Dwight Eisenhower')
    end
  end

  describe "#initials" do 
    it "should return all initials" do 
      person = Person.new(first_name: 'Dwight', middle_name: 'David', last_name: 'Eisenhower')
      expect(person.initials).to eq('D.D.E.')
    end

    it "the initials should only have two characters if the middle name is missing" do
      person = Person.new(first_name:'Dwight', last_name: 'Eisenhower')
      expect(person.initials).to eq('D.E.')
    end
  end
end
