require_relative "font_type"
require_relative "service"

class HandWriting

	attr_accessor :font_type

	def initialize
		@service = Service.new
		@font_type = Array.new
	end

	def letter id
		option = 0
		system("clear")
		puts "Elija el titulo de su carta (presione 'Enter') y luego comience a escribirla."
		letter_name = gets.chomp
		system("clear")
		puts "				#{letter_name}"
		puts
    text = gets.chomp
    puts
    puts "¿Qué tamaño de letra desea?"
    font_size = gets.chomp
    puts
    puts
    font_size += ".px"
    font_size.to_i
        objects = {text: text,
        		 handwriting_id: id,
        		 font_size: font_size
        		}
        while option < 1 || option > 2
        puts "Tenemos la opcion de convertir su carta en alguno de nuestros formatos."
        puts "¿A cuál formato desea convertirla?"
        puts
        puts "1. PNG"
        puts "2. PDF"
        option = gets.chomp.to_i
        system("clear")
	        if option < 1 || option>2
	        	puts "Has escogido una opcion inválida."
	        	puts
	        	puts "Intenta de nuevo. ('Enter' para continuar)"
	        	gets.chomp
	        	system("clear")
	        elsif option == 1
	        	letter_name +=".png"
	        	@service.render(letter_name, objects, "png")	
	        	puts "Su carta ha sido escrita."
	        	puts
	        elsif option == 2
	        	letter_name +=".pdf"
	        	@service.render(letter_name, objects, "pdf")
	        	puts "Su carta ha sido escrita."
	        	puts
	        end
	    end
	  letter_name
	end

	def choose_type
		count=0
		system("clear")
		@service.response.each_with_index do |elem, index|
			@font_type.push FontType.new(elem["id"], elem["title"])
			puts "#{index+1} - #{elem["title"]}  "
			count+=1
		end
		font = 1
		while font != 0 
			puts
			puts "¿Cuál fuente desea para su carta?"
			choice=gets.chomp.to_i
			if choice >= 102 || choice == 0
				puts 
				puts "Opcion incorrecta. Intente de nuevo con una opcion válida."
			else 
				font = 0
				system("clear")
				puts "Se usará #{@font_type[choice-1].type_name} como la fuente de su carta"
				puts
				puts
			end
		end
		@font_type[choice-1].id
	end
end
