class Fee < ApplicationRecord
  FEE = ['KINDERGARDEN SECTION', 'CLASS 1', 'CLASS 2' ,'CLASS 3', 'CLASS 4', 'CLASS 5','CLASS 6' ,'CLASS 7', 'CLASS 8' ,'CLASS 9', 'CLASS 10', 'CLASS 11' ,'CLASS 12']
  validates :klass, uniqueness: true
end
