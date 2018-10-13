class SearchController < ApplicationController
  def index
  end

  def create
    @results = Array.new
    resultjs = Search.parsejs(params[:search][:result])
    @results << resultjs
    resultgd = Search.parsegd(params[:search][:result])
    @results << resultgd
    @a = @results.map {|r| r.any?}
    respond_to do |format|
      format.js
    end
  end
end
