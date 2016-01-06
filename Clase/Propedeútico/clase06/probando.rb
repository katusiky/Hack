a= []
s= 0
ma= -1
me= 101
for i in 0..14
	a[i]= rand(100)
	if a[i] < me
		me= a[i]
	end
	if a[i] > ma
		ma= a[i]
	end
	s= s + a[i]
end 

puts "a = #{a}" 
puts "min = #{me}"
puts "max = #{ma}"
puts "prom = #{s / a.length}"