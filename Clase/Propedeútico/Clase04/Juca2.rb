puts "Ingrese su edad:"

edad = gets.chomp
edad = edad.to_i

if ( edad >= 21 )
	puts "Puede ingresar al local"
else
	puts "Prohibida la entrada para menores"
end
