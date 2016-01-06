puts "ingresa numero: "

num = gets.chomp.to_i

if (num >= 10 && num <= 100)
	num = true
else 
	num = false
end

puts num