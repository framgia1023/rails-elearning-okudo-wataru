class AnswersController < ApplicationController

	@@already_ans = []

	def new
		@user = current_user
		@lesson = Lesson.find(params[:lesson_id])
		@category = @lesson.category
		@answer = Answer.new

		@word = (@category.words - @lesson.words).first

		if @word == nil
			redirect_to user_lesson_answers_url(@user, @lesson)
		end
	end

	def create
		@answer = Answer.new(answer_params)
		if @answer.save

			flash[:success] = "go next stage"
			redirect_to request.referrer
		else
			flash[:danger] = "anything wrong happen"
			redirect_to root_url
		end
		
	end

	def index
		@lesson = Lesson.find(params[:lesson_id])
		@category = @lesson.category
		@words = @lesson.words
		@choices = @lesson.choices
		
	end

	private

	def answer_params
		params.permit(:lesson_id,:choice_id,:word_id)
	end

end