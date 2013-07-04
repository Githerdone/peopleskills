class Skill < ActiveRecord::Base
  has_many :proficiencies
  has_many :users, through: :proficiencies

  validates :name, uniqueness: true

  def user_with_proficiency(rating)
    User.find(self.proficiencies.where(proficiency: rating)[0].user_id)
  end
end

