class Skill < ActiveRecord::Base
  has_and_belongs_to_many :applicants
  has_and_belongs_to_many :vacancies
end
