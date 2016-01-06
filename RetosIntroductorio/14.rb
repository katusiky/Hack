puts "Ingresa Numero: "

num = gets.chomp.to_i
sum = 0
for	 number in 1..num
	sum = sum + number
end
if number > 50
	puts "ese numero no lo se"
else
	puts "la suma de los numeros es #{sum}"
end
	