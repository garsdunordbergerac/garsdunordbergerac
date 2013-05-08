class Summary < ActiveRecord::Base
  attr_accessible :document_url, :happened_at, :title

  def self.for_year(year)
    where('happened_at between ? and ?', Date.new(year, 1, 1), Date.new(year, 12, 31))
  end

  def self.years
    pluck('distinct year(happened_at)')
  end
end
