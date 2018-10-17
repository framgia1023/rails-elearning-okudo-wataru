class LessonsController < ApplicationController

	def create

		@lesson = current_user.lessons.new(lesson_params)

		if @lesson.save
			@lesson.create_activity
			flash[:success] = "Get into QUEST"
			# redirect_to root_url
			redirect_to new_user_lesson_answer_url(user_id: current_user.id,lesson_id: @lesson.id)
		else
			flash[:danger] = "anything wrong happen"
			redirect_to categories_url
		end
	end

	def new
	end


	private

		def lesson_params
			params.permit(:category_id, :user_id)
		end
end
