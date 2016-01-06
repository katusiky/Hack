# Funciones

def minimo (x)
	menor = x[0]
	for i in 0..x.length-1
		if x[i] < menor
			menor = x[i]
		end
	end
	return menor
end

def maximo (x)
	mayor = x[0]
	for i in 0..x.length-1
		if x[i] > mayor
			mayor = x[i]
		end
	end
	return mayor
end

def llenar_Arreglo(l)
	z = []
	for i in 0..l - 1
		z[i] = rand(100)
	end
	return z
end

def promedio(x)
	num= 0
	for array in 0..x.length - 1
		num = num + x[array]
	end
	return num / x.length 	
end	

def showInf(x, y)
	puts "#{y} = #{x}"
	puts "min = #{minimo(x)}"
	puts "max = #{maximo(x)}"
	puts "prom = #{promedio(x)}"
end

def existencia(num, x)
	ocurrencia= []
	for i in 0..x.length - 1
		if x[i]== num 
			ocurrencia[ocurrencia.length] = i
		end
	end
end

def buscar (num, x, t)
	ocurrencia = existencia(num, x, t)
	if ocurrencia.length > 0
		puts "encontrado en las posiciones #{ocurrencia} del arreglo #{t}"
	else
		puts "No Encontrado"
	end
end 

def principal 
	op = ""
	while (op != "si")
		puts "ingresa numero maldito:"
		num = gets.chomp.to_i
		buscar(num, a, "a")
		buscar(num, b, "b")
		buscar(num, c, "c")
		puts "Desea Salir?"
		op = gets.chomp
	end
end
#Trabajo Especifico

a= llenar_Arreglo(rand(20))
b= llenar_Arreglo(rand(20))
c= llenar_Arreglo(rand(20))

showInf(a, "Arreglo")
showInf(b, "Segundo Arreglo")
showInf(c, "Arreglo3")

buscar(num, @a, "a")