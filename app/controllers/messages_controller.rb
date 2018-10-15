class MessagesController < ApplicationController

	before_action :require_login

	def index
		@message = Message.order(created_at: :asc)
	end

	def new
		@message = Message.new
	end

	def create
		@message = Message.new(message_params)
		@message.user_id = current_user.user_id

	end

	private
	def message_params
		params.require(:messages).permit(:body)
	end
end
