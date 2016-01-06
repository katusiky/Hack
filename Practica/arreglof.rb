size = gets.chomp.to_i
def nueva (array, size)
	number = rand(100)+1
	if size < 20
		if array.length < 20
		array.push(number)
		nueva(array, size)
		else
		return			
		end
		puts array.to_s
	end
end

arreglo = []

nueva(arreglo, size)