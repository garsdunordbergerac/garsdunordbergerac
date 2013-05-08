class Content < ActiveRecord::Base
  attr_accessible :code, :content

  def self.for_code(code)
    content = where(code: code).first
    content.content if content
  end
end
