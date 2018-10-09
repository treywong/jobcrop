class JobsController < ApplicationController
	def new
		@job = Job.new
	end

	def index
		@job = Job.all.order(:created_at).reverse_order  # .page params[:page]
	end

	def show
		@job = Job.find_by_id(params[:id])
	end
end
