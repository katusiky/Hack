size = gets.chomp.to_i
def nueva (array, matrix, size)
	number = rand(30)
	if size < 10
		if array.length < 10
		array.push(number)
		nueva(array, matrix, size)
		else
			if matrix.length < size
				matrix.push(array)
				array = []
				nueva(array, matrix, size)
			else 
				return
			end
		end
	end
end

matriz = []
arreglo = []

nueva(arreglo, matriz, size)
puts matriz.to_s