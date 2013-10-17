class CreateSkillsVacancies < ActiveRecord::Migration
  def change
    create_table :skills_vacancies do |t|
      t.belongs_to :skill
      t.belongs_to :vacancy
    end
  end
end
