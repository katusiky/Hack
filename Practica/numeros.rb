array = []
def arreglo (tamaño, arreglos)
	tamaño.times{|e| arreglos[e]=(rand(100)+1)}
	puts "el arreglo es: #{arreglos.to_s}"
	return
end

	arreglo(20, array)

def buscarPar (arreglo)
	par = array.select{|contador| contador %2 ==0}
	return par
	puts "los numeros pares son: #{par.to_s}"
end
	impar = array.select{|contador| contador %2 != 0}
	indicePar = array.select{|e| e %2==0 && array.find_index(e)%2==0}
	indiceImpar = array.select{|e| e %2!=0 && array.find_index(e)%2!=0}
	puts "los numeros impares son: #{impar.to_s}"
	puts "los numeros e indice que coinciden en par son: #{indicePar.to_s}"
	puts "los numeros e indice que coinciden en impar son: #{indiceImpar.to_s}"