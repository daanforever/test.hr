module ApplicationHelper
  def update_skills(owner)
      owner.skills.delete_all
      params[:skill][:names].split(/,\s*/).uniq.each do |s|
        owner.skills << Skill.find_or_create_by(name: s)
      end
    end
end
