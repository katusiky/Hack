a = []

for i in 0..19
	rep = false 
	j = 0
	x = rand(20) + 1
	while !rep && j < a.length-1
		rep = x == a[j] ? true : false
		j += 1
	end
	a[i] = x 
end
puts 
puts "D: #{a}:#{a.length}"

for j in 0..a.length - 1
	imenor = j
	for i in j..a.length - 1
		if a[i] < a[imenor]
			imenor = i
		end
	end
	t = a[j]
	a[j] = a[imenor]
	a[imenor] = t
end
puts

puts "O: #{a}:#{a.length}"
puts