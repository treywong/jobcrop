class ChatsController < ApplicationController
  
  def videochat
    @random_number = rand(0...10_000)
  end
  
end