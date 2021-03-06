# == Schema Information
#
# Table name: skills
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  created_at :datetime
#  updated_at :datetime
#

class Skill < ActiveRecord::Base
  has_and_belongs_to_many :applicants
  has_and_belongs_to_many :vacancies

  validates :name, uniqueness: true
end
