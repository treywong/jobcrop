class SearchController < ApplicationController
  def index
  end

  def create
    @results = Array.new
    @results += [
                  resultjs = Search.parsejs(params[:search][:result]),
                  resultgd = Search.parsegd(params[:search][:result]),
                  resulti = Search.parsei(params[:search][:result]),
                  resultfj = Search.parsefj(params[:search][:result])
                ]
    @a = @results.map {|r| r.any?}
    respond_to do |format|
      format.js
    end
  end
end
