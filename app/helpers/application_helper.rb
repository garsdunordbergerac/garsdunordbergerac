module ApplicationHelper
  def current_event_year(years)
    current_year = Date.today.year
    years.include?(current_year.to_s) ? current_year : years.first
  end
end
