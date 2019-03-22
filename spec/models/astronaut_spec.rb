require 'rails_helper'

describe Astronaut, type: :model do
  describe 'Validations' do
    it { should validate_presence_of :name }
    it { should validate_presence_of :age }
    it { should validate_presence_of :job }
  end

  describe 'Relationships' do
    it { should have_many :astronaut_missions}
    it { should have_many :missions}
  end

  describe 'Class Methods' do
    it '.average_age should calculate average age of all astronauts' do
      astronaut_1 = Astronaut.create(name: "Neil Armstrong", age: 37, job: "Commander")
      astronaut_1 = Astronaut.create(name: "Buzz A", age: 33, job: "Pilot")

      expect(Astronaut.average_age).to eq(35)
    end

    xit '.can sort all missions alphabetically' do
      astronaut_1 = Astronaut.create(name: "Neil Armstrong", age: 37, job: "Commander")
      astronaut_2 = Astronaut.create(name: "Buzz A", age: 33, job: "Pilot")

      mission_1 = Mission.create(title: "Heavens 4", time_in_space: 5)
      mission_2 = Mission.create(title: "Gemini 1", time_in_space: 4)

      astronaut_1.missions << mission_1
      astronaut_2.missions << mission_2
      # binding.pry
      expect(Astronaut.all_missions_sorted).to eq(["Gemini 1", "Heavens 4"])
    end
  end
end
