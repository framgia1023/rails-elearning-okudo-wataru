class Admin::WordsController < AdminController


	def new
		@category = Category.find(params[:category_id])
		@word = Word.new
		4.times {
			@word.choices.build
		}
	end

	def create
		@word = Word.new(word_params)
		@word.category_id = params[:category_id]

		if @word.save
			flash[:success] = "make quest completely"
			redirect_to root_url
		else
			@category = Category.find(params[:category_id])
			render "new"
		end
	end

	def index
		@category = Category.find(params[:category_id])
		@words = @category.words.all
	end

	def show
		@category = Category.find(params[:category_id])
		@word = @category.word
		@choice = @word.choices.all
	end

	def edit
		@category = Category.find(params[:category_id])
		@word = Word.find(params[:id])
		@choice = @word.choices.all
	end

	def update
		@word = Word.find(params[:id])
		if
			@word.update_attributes(word_params)
			flash[:success] = "success modify word"
			redirect_to admin_category_words_url(@word.category_id)
		else
			@category = Category.find(params[:category_id])
			render "edit"
		end
	end

	def destroy
		@word = Word.find(params[:id])
		@word.destroy
		flash[:success] = "success deleting"
		redirect_to admin_category_words_url(@word.category_id)
	end

	private

		def word_params
			params.require(:word).permit(:content, choices_attributes:[:id, :content, :correct])
		end


end