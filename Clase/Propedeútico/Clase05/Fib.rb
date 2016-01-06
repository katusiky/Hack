puts "Ingresa el número"
num = gets.chomp.to_i

a = [0, 1]

n = 2

while (n <= num) do
	a[n] = a[n-1] + a[n-2]
	n = n + 1
end

puts "fibonacci[#{num}]: #{a[num]}"