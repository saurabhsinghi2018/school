class Eligibility < ApplicationRecord

  ELIGIBILITY = ['KINDERGARDEN SECTION', 'CLASS 1', 'CLASS 2' ,'CLASS 3', 'CLASS 4', 'CLASS 5','CLASS 6' ,'CLASS 7', 'CLASS 8' ,'CLASS 9', 'CLASS 10', 'CLASS 11' ,'CLASS 12']
  validates_presence_of :dateofbirthtill, :dateason

  validate :end_date_is_after_start_date

  private

  def end_date_is_after_start_date
    return if dateason.blank? || dateofbirthtill.blank?
    if dateason < dateofbirthtill
      errors.add(:date_as_on, "cannot be before the start date")
    end
  end

end
