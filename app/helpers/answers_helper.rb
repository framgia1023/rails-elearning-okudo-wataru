module AnswersHelper

	def trufal(torf)
		if torf == true
			fa_icon("trophy 2x")
		else
			fa_icon("skull-crossbones 2x")
		end
	end

	def count_true(anything)
		correct = anything.collect{ |item| item.correct || nil}.compact.size
	end

	def count_word(something)
		something.collect{|a| a.id}.size
	end

end
