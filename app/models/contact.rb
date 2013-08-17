class Contact < ActiveRecord::Base
  attr_accessible :email, :name, :phone, :position

  validates :email, presence: true, format: { with: Devise.email_regexp }
  validates :name,  presence: true
end
