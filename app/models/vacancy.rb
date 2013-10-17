class Vacancy < ActiveRecord::Base
  has_and_belongs_to_many :skills
  has_many :applicants, through: :skills
end
