class MessageBroadcastJob < ApplicationJob
	queue_as :default

	def perform(message)
		ActionCable.server.broadcast 'message_channel', message: render_message(message)
	end

	private
	def render_message
		MessagesController.render partial: 'messages/message', locals: {message: message} 
	end




end