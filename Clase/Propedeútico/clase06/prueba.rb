puts "in"
n= gets.chomp.to_i

f= [0, 1]
i = 2

while (i <= n)
	f[i]= f[i-1] + f[i-2]
	i= i + 1
end

puts "f[#{n}]: #{f[n]}"