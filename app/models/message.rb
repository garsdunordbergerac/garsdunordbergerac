class Message
  include ActiveModel::Validations
  include ActiveModel::Conversion
  extend ActiveModel::Naming

  attr_accessor :content, :from, :subject, :to

  validates :content, presence: true
  validates :from,    format: { with: Devise.email_regexp }
  validate  :receiver_exist?
  validates :subject, presence: true

  def initialize(attributes = {})
    attributes.each do |name, value|
      send("#{name}=", value)
    end
  end

  def persisted?
    false
  end

  def to_user
    Contact.find_by_id(self.to)
  end

private

  def receiver_exist?
    Contact.exists?(self.to)
  end
end
