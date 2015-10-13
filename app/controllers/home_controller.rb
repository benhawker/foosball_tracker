class HomeController < ApplicationController
	def index 

	end

	def ranking
		@teams = Team.order(wins: :desc)
	end
end
