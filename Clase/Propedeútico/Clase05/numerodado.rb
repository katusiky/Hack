puts "Numero"
num= gets.chomp.to_i

sum=0
it=1

for it in 1..num do
	sum = sum + it
end


puts "La sumatoria es: #{sum}"