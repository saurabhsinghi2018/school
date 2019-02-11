class Eligibility < ApplicationRecord

  ELIGIBILITY = ['KINDERGARDEN SECTION', 'CLASS 1', 'CLASS 2' ,'CLASS 3', 'CLASS 4', 'CLASS 5','CLASS 6' ,'CLASS 7', 'CLASS 8' ,'CLASS 9', 'CLASS 10', 'CLASS 11' ,'CLASS 12']
  validates_presence_of :date_of_birth_till, :date_as_on

  validate :end_date_is_after_start_date

  private

  def end_date_is_after_start_date
    return if date_as_on.blank? || date_of_birth_till.blank?
    if date_as_on < date_of_birth_till
      errors.add(:date_as_on, "cannot be before the start date")
    end
  end

end
