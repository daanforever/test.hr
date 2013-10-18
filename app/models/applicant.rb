# == Schema Information
#
# Table name: applicants
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  contacts   :text
#  boolean    :string(255)
#  salary     :integer
#  created_at :datetime
#  updated_at :datetime
#

class Applicant < ActiveRecord::Base
  has_and_belongs_to_many :skills
  has_many :vacancies, through: :skills

  validates :name, presence: true, format: { with: /\A([а-яА-Я]+)\s+([а-яА-Я]+)\s+([а-яА-Я]+)\Z/ }
  validates :contacts, presence: true, format: { with: /(\+?\d\-?\(?\d+\)?\-?\d{1,3}\-?\d{1,3}\-?\d{1,3}|\S+@\S+)/ }
  
  def skills_names
    self.skills.map{ |s| s.name }.join(', ')
  end
end
