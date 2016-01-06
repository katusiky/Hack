array =[1,2,3,4,5,6]
array.select!{ |e| e % 2 == 0 }.map!{|m| m * 2} 
puts array.to_s

#.map metodo para modificar posicion a posicion el arreglo. con "!" modificas el arreglo original. sin el signo dejas el dato en el aire.
#.select metodo para seleccionar cierto tipo de datos dentro de un arreglo. 