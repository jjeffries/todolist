class Profile < ActiveRecord::Base
  belongs_to :user

  validate :name
  validates :gender, inclusion: { in: %w(male female) }
  validate :male_sue

  def name
  	if first_name.nil? && last_name.nil?
  		errors.add(:first_name, "Must have either a first name or last name")
  	end
  end

  def male_sue
  	if first_name == "Sue" && gender == "male"
  		errors.add(:gender, "Hey Johnny! Can't have a boy named Sue")
  	end
  end

  def self.get_all_profiles(min, max)
  	Profile.where("birth_year BETWEEN :min AND :max", min: min, max: max).order(birth_year: :asc)
  end

end
