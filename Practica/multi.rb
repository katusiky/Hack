
def recorrer
arreglo = [1,2,3,4,5]
puts "array original #{arreglo.to_s}"
arregloDos = []
arreglo.each do |h| 
	arregloDos[h] = arreglo[h]*2
	end 
puts "array multiplicada #{arregloDos.to_s}"
end

puts recorrer 