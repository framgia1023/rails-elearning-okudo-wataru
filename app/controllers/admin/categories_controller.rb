class Admin::CategoriesController < AdminController

	def new
		@category = Category.new
	end

	def edit
		@category = Category.find(params[:id])
	end

	def index
		@category = Category.all
	end

	def create
		@category = Category.new(category_params)

		if @category.save
			flash[:success] = "success making quest"
			redirect_to "/admin/home"
		else
			flash[:danger] = "can't make quest"
			render "new"
		end
	end

	def update
		@category = Category.find(params[:id])
		if
			@category.update_attributes(category_params)
			flash[:success] = "success modify quest"
			redirect_to admin_categories_url
		else
			render "edit"
		end
	end

	def destroy
		@category = Category.find(params[:id])
		@category.destroy
		flash[:success] = "success deleting"
		redirect_to admin_categories_url
	end

	private

		def category_params
			params.require(:category).permit(:title, :description)
		end


end