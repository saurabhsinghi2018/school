module SectionsHelper
  def checked(area)
    @candidate.grade.nil? ? false : @candidate.grade.match(area)
  end
end
