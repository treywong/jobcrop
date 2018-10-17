 class PersonalMessagesController < ApplicationController
	# before_action :find_conversation!
	# def index
	# 	@receiver = User.find_by(id: params[:receiver_id])
	# 	@conversation = Conversation
	# end
	

	def new
  		@personal_message = current_user.personal_messages.build
  		@user = User.all
		@receiver = User.find_by(id: params[:receiver_id])
	end

	def create
		@receiver = User.find_by(id: params[:receiver_id])
		@conversation ||= Conversation.create(author_id: current_user.id, receiver_id: @receiver.id)
		
	    @personal_message = current_user.personal_messages.build(personal_message_params)
	    @personal_message.conversation_id = @conversation.id
	    @personal_message.save!

	    flash[:success] = "Your message was sent!"
	    redirect_to conversation_path(@conversation)
  	end


  	private

	  def personal_message_params
	    params.require(:personal_message).permit(:body)
	  end

	  # finds conversation by id
	  def find_conversation!
	    @conversation = Conversation.find_by(id: params[:conversation_id])
	    redirect_to(root_path) and return unless @conversation && @conversation.participates?(current_user)
	  end

end
