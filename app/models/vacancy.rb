# == Schema Information
#
# Table name: vacancies
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  upto       :date
#  salary     :integer
#  contacts   :text
#  created_at :datetime
#  updated_at :datetime
#

class Vacancy < ActiveRecord::Base
  has_and_belongs_to_many :skills
  has_many :applicants, through: :skills
  accepts_nested_attributes_for :skills
end
