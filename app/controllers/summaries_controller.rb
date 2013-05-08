class SummariesController < ApplicationController
  respond_to :json

  def index
    year = params[:year].to_i
    render json: Summary.for_year(year).order('happened_at desc')
  end
end
