require_relative "handwriting"

class Option

	def initialize
    choice = 1
    while choice != 0
  		puts "1. Elegir un tipo de fuente "
  		puts "2. Escribir carta "
      puts "3. Salir"
      choice = gets.chomp.to_i
      if choice == 1
        @new = HandWriting.new
        @font_id = @new.choose_type
      elsif choice == 2
        if @new == nil 
          puts "Es necesario un tipo de fuente para comenzar a escribir su carta."
        else
          @file = @new.letter(@font_id)
        end
      elsif choice == 3
        system("clear")
        puts "                               ------------------------"
        puts "                                Gracias por visitarnos."
        puts "                               ------------------------"
        choice = 0 
			else
        system("clear")
				puts "Respuesta incorrecta. Vuelve a intentar."
				puts 
				puts
      end
    end
  end
end

