class Word < ActiveRecord::Base
  attr_accessible :group, :level, :name

  GROUPS = %w(Fruits Vegetables Colors)
  LEVELS = 1..5

  validates :name, presence: true
  validates :group, presence: true, inclusion: { in: GROUPS }
  validates :level, presence: true, inclusion: { in: LEVELS }
end
