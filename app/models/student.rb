class Student < ActiveRecord::Base
  validates :school, presence:true
  belongs_to :user


end
