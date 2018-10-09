class UsersController < ApplicationController
	def new
		@user = User.new
	end
end

#database: 'db/development.sqlite3'