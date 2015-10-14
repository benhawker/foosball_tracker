class HomeController < ApplicationController
	def index 
	end

	def ranking
		@teams = Team.where("wins > 2").order(win_percentage: :desc)
	end
end
