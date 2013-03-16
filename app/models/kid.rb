class Kid < ActiveRecord::Base
  attr_accessible :charactor_img, :created_at, :family_id, :name, :updated_at

  belongs_to :family, class_name: "User"
  validates :name, presence: true, length: { maximum: 10 }
end
