class Headquarter < ActiveRecord::Base
  attr_accessible :city, :latitude, :longitude, :postcode, :street, :title

  validates :city,      presence: true
  validates :latitude,  presence: true
  validates :longitude, presence: true
  validates :postcode,  presence: true
  validates :street,    presence: true
  validates :title,    presence: true
end
