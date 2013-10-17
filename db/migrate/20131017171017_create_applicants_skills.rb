class CreateApplicantsSkills < ActiveRecord::Migration
  def change
    create_table :applicants_skills do |t|
      t.belongs_to :applicant
      t.belongs_to :skill
    end
  end
end
