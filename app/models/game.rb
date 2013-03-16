class Game < ActiveRecord::Base
  attr_accessible :created_at, :kid_id, :points

  belongs_to :kid
end
