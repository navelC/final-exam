class Admin::BaseController < ApplicationController
	layout "admin_layout"
	before_action :is_admin

	def is_admin
		unless current_user and current_user.role == 'admin'
			redirect_to root_path
		end
	end
end
