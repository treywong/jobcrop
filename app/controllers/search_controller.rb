class SearchController < ApplicationController
  def index
  end

  def create
    @results = Array.new
    @results += [
                  resultjc = Search.parsejc(params[:search][:result]),
                  resultjs = Search.parsejs(params[:search][:result]),
                  resultgd = Search.parsegd(params[:search][:result]),
                  resulti = Search.parsei(params[:search][:result]),
                  resultfj = Search.parsefj(params[:search][:result]),
                  resultjstore = Search.parsejstore(params[:search][:result]),
                ]
    @results.flatten
    byebug
    render json: @results
  end
end
