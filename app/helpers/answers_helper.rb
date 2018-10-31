module AnswersHelper

	def trufal(torf)
		if torf == true
			# fa_icon("trophy 2x")
			embedded_svg("icon/torophy.svg", class: "icon")
		else
			# fa_icon("skull-crossbones 2x")
			embedded_svg("icon/skull.svg", class: "icon")
		end
	end

	def count_true(anything) 
		correct = anything.collect{ |item| item.correct || nil}.compact.size
	end

	def count_word(something)
		something.collect{|a| a.id}.size
	end

	def show_monster
		image_tag("/monster/monster#{rand(1..8)}.png")
	end

end
