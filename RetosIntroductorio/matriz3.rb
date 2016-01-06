
m= []

for i in 0..5
	m[i]=[]
	for j in 0..5
		m[i][j] = rand (36)
	end 
end
for i in 0..9-1
	puts m[i].to_s
end
puts

for i in 0..m.length-1
	print m[i][i].to_s + " "
end
puts