class Event < ActiveRecord::Base
  attr_accessible :begin_at,
                  :description,
                  :end_at,
                  :album_title,
                  :place,
                  :title

  def self.for_year(year)
    where('begin_at between ? and ?', Date.new(year, 1, 1), Date.new(year, 12, 31))
  end

  def self.next
    where('begin_at >= ?', Date.today).order('begin_at').first
  end

  def self.years
    pluck('distinct year(begin_at)')
  end
end
