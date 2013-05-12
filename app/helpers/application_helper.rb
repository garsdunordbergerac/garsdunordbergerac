module ApplicationHelper
  def current_event_year(years)
    current_year = Date.today.year.to_s
    years.include?(current_year) ? current_year : years.first
  end
end
