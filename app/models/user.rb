class User < ActiveRecord::Base
  has_many :proficiencies
  has_many :skills, through: :proficiencies
  
  def proficiency_for(skill)
    self.proficiencies.where(:skill_id => Skill.where(:name => skill.name))[0].proficiency
  end

  def set_proficiency_for(skill, rating)
    temp = Proficiency.joins(:user, :skill).where("users.name" => self.name, "skills.name" => skill.name)[0].id
    prof = Proficiency.find(temp)
    prof.update_attributes(proficiency: rating)
  end

end


