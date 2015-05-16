class Mentor < ActiveRecord::Base
  belongs_to :user
  has_many  :students, dependent: :destroy
  validates :school, presence:true
  validates :graduation_year, :numericality => { :greater_than_or_equal_to => 0 }
  validates :graduation_year, presence:true

end
