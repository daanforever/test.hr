class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def update_skills(owner)
      owner.skills.delete_all
      params[:skill][:names].split(/,\s*/).uniq.each do |s|
        owner.skills << Skill.find_or_create_by(name: s)
      end
  end

end
