class Applicant < ActiveRecord::Base
  has_and_belongs_to_many :skills
  has_many :vacancies, through: :skills
end
