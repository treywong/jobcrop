class SearchController < ApplicationController
  def index
  end

  def create
    @resultjs = Search.parsejs(params[:search][:result])
    @resultgd = Search.parsegd(params[:search][:result])
    respond_to do |format|
      format.js
    end
  end
end
