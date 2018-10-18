class ApplicationController < ActionController::Base
	include SessionsHelper
	include LessonsHelper
	include UsersHelper
end
