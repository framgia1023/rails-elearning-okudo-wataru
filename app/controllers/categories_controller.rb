class CategoriesController < ApplicationController

	def index
		# @categories = Category.where(Word.id.exist).all.paginate(page: params[:page], per_page: 9)
		@categories = Category.where(id: Word.select(:category_id)).paginate(page: params[:page], per_page: 9)
		@user = current_user
		@lesson = current_user.lessons.build
	end

	def show
		@category = Category.find(params[:id])
	end

end
# Parent.where(id: Children.select(:parent_id).
# Category.where(id: Word.select(:category_id)).all.pagenate(page: params[:page], per_page: 9)