


array = [] # CREE UN ARREGLO

while array.length != 20 # MIENTRAS QUE LA LONGITUD DEL ARREGLO NO SEA 20 SE EJECUTA OTRA VES

	findedNum = false # SI EL NUMERO SE ENCONTRO

	ramdom = rand(20) + 1 # NUMERO RANDOM DEL 1 AL 20

	for num in 0..array.length # CICLO QUE SE REPITE EL MISMO NUMERO DE VECES QUE LA LONGITUD DEL ARREGLO VIENDO NUMERO POR NUMERO

		if array[num] == ramdom #SI EL ELEMENTO DEL ARREGLO ES IGUAL AL NUMERO RANDOM 

			findedNum = true # FINDEDNUM ES IGUAL A TRUE

		end

	end

	if findedNum == false # SI FINDEDNUM ES IGUAL A FALSE, OSEA QUE EL NUMERO RANDOM NO SE ENCUENTRA EN EL ARREGLO

		array.push(ramdom) #EL NUMERO SE AGREGAR AL ARREGLO

	end

end


puts "O: #{array}:#{array.length}" # IMPRIME LOS RESULTADOS DEL ARRAY




for num in 0..array.length - 1 # CICLO PRINCIPAL DE 0 AL LA LONGITUD DEL ARREGLO

	numMenor = num # VARIABLE numMenor QUE ES IGUAL AL NUMERO POR DONDE VA EL CICLO

	for i in num..array.length - 1 # CICLO SECUNDARIO DESDE EL NUMERO POR DONDE VA EL CICLO PRINCIPAL A LA LONGITUD DEL ARREGLO 

		if array[i] < array[numMenor] # SI LA POCISION DEL ARRAY[NUMERO DE CICLO SECUNDARIO] ES MENOR A LA POSICION DEL ARREGLO[NUMERO DE CICLO PRINCIPAL] /// CON CAMBIAR EL CONDICIAL A SI ES MAYOR QUE, SE ORDENARIAN DE MAYOR A MENOR

			numMenor = i #ENTONCES numMenor ES IGUAL A LA POCISION DONDE ESTABA EL ELEMENTO MENOR DEL ARREGLO (i)
						# PARA LUEGO VOLVER A PREGUNTAR CUAL ES MENOR CON LA SIGUIENTE POSICION DEL CICLO SECUNDARIO
						# Y OBTENER EL ELEMENTO DEL ARREGLO DE MENOR VALOR
		end

	end

	temporary = array[num] # SE GUARDA EL VALOR QUE ESTABA EN LA POSICION DEL CICLO PRINCIPAL // POR EJEMPLO, ELEMT=7 CICLO-PRINCIPAL=0 

	array[num] = array[numMenor] #SE EL ELEMENTO SOBRE EL ARREGLO EN LA POSICION DEL CICLO PRINCIPAL (0) 

	array[numMenor] = temporary #SE GUARDA EL ELEMENTO QUE ESTABA ANTES EN EL ARREGLO EN LA POSICION DEL CICLO PRINCIPAL
								#EN LA POSICION DONDE ESTABA EL ELEMENTO DE MENOR VALOR PREVIAMENTE
end

puts
puts "1: #{array}:#{array.length}"

