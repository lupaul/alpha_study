class Consultation < ApplicationRecord
  TIME_STRING = [["早上9~12點","早上9~12點"], ["下午1點~5點","下午1點~5點"],["晚上7~10點","晚上7~10點"]]
  belongs_to :user , optional: true
  serialize :datetime
  belongs_to :school, optional: true
  belongs_to :license, optional: true
  # enum datetime: {"早上9~12點": 0 , "下午1點~5點": 1, "晚上7~10點": 2}

end
