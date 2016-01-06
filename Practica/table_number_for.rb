puts "Dame un número: "
number = gets.chomp.to_i

for i in 1..10
	puts "#{number}" + " * " + "#{i}" + " = " + "#{number * i}"
end 
