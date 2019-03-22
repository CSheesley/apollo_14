class Astronaut < ApplicationRecord
  validates_presence_of :name, :age, :job

  has_many :astronaut_missions
  has_many :missions, through: :astronaut_missions

  def self.average_age
    average(:age).round
  end

  # def self.all_missions_sorted
  #   missions.order(:name) #not a class method...
  # end
end
