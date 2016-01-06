a = []

for r in 0..14
	a[r] = rand(101)
end 

sum = 0
me = a[0]
ma = a[0]

for r in 0..14
	if a[r] < me
		me = a[r]
	end
	
	if a[r] > ma
		ma = a[r]
	end 
	
	sum = sum + a[r]
end

puts "a = #{a}" 
puts "min = #{me}"
puts "max = #{ma}"
puts "prom = #{sum / 15}"