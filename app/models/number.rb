class Number < ActiveRecord::Base
  attr_accessible :code, :value

  validates :code,  presence: true, uniqueness: true
  validates :value, presence: true
end
