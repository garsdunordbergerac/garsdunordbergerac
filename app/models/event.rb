class Event < ActiveRecord::Base
  attr_accessible :album_title,
                  :begin_at,
                  :description,
                  :end_at,
                  :place,
                  :title

  validates :begin_at, presence: true
  validates :place,    presence: true
  validates :title,    presence: true

  def self.for_year(year)
    where('begin_at between ? and ?', Date.new(year, 1, 1), Date.new(year, 12, 31)).order('begin_at DESC')
  end

  def self.next
    where('begin_at >= ?', Date.today).order('begin_at').first
  end

  def self.years
    order('year desc').pluck('distinct cast(extract(year from begin_at) as bigint) as year')
  end
end
