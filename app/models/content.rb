class Content < ActiveRecord::Base
  attr_accessible :code, :content

  validates :code, presence: true, uniqueness: true

  def self.for_code(code)
    content = where(code: code).first
    content.content if content
  end
end
