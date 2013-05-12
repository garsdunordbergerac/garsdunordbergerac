class Summary < ActiveRecord::Base
  attr_accessible :document_url, :happened_at, :title

  validates :happened_at, presence: true
  validates :title,       presence: true

  def self.for_year(year)
    where('happened_at between ? and ?', Date.new(year, 1, 1), Date.new(year, 12, 31))
  end

  def self.years
    order(:year).pluck('distinct extract(year from happened_at) as year')
  end
end
