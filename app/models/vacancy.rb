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

  validates :name, presence: true
  validates :upto, presence: true
  validates :salary, presence: true
  validates :contacts, presence: true

  def skills_names
    self.skills.map{ |s| s.name }.join(', ')
  end
end
