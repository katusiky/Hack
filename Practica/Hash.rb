
hash = Hash.new

def add
salir = true
while salir == true
	puts "Agregar palabra"
	pal= gets.chomp.to_sym
	puts
	puts "Agregar definicion"
	defi= gets.chomp	
	hash[pal] = defi
	puts "--------------------------"
	puts
	puts "mas? 'si' o 'no'"
	r = gets.chomp.to_s
	puts
	if r== 'si' 
		salir = true
	else 
		salir = false
	end
	puts
end

hash.keys.each do |r|
	puts "Palabra: #{r}"
	puts "Definicion: #{hash[r]}"
	puts "-----------------------------"
	puts
end