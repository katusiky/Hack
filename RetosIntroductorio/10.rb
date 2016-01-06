puts "Ingrese numero"
num = gets.chomp.to_i
if (num % 2) == 0
	num = true
	puts "#{num}"
else 
	num = false
	puts "#{num}"
end 