require 'rails_helper'

describe 'astronaut index page' do
  context 'as a visitior' do
    it 'shows a list of astronauts with name, age, and job' do

      astronaut = Astronaut.create(name: "Neil Armstrong", age: 37, job: "Commander")

      visit '/astronauts'

      expect(page).to have_content(astronaut.name)
      expect(page).to have_content(astronaut.age)
      expect(page).to have_content(astronaut.job)
    end
  end

  it 'shows a list the average age of all astronauts' do

    astronaut_1 = Astronaut.create(name: "Neil Armstrong", age: 37, job: "Commander")
    astronaut_1 = Astronaut.create(name: "Buzz A", age: 33, job: "Pilot")

    visit '/astronauts'

    expect(page).to have_content("#{Astronaut.average_age}")
  end

  xit 'shows a list of the space missions in alphabetical order for each astronaut' do

    astronaut_1 = Astronaut.create(name: "Neil Armstrong", age: 37, job: "Commander")
    astronaut_2 = Astronaut.create(name: "Buzz A", age: 33, job: "Pilot")

    mission_1 = Mission.create(title: "Heavens 4", time_in_space: 5)
    mission_2 = Mission.create(title: "Gemini 1", time_in_space: 4)

    astronaut_1.missions << mission_1
    astronaut_2.missions << mission_2

    visit '/astronauts'

    expect(page).to have_content(["Gemini 1", "Heavens 4"])
  end
end
