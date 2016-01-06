#rangos: con dos puntos(..) agarrará todos los valores del rango y con tres puntos("...") no tomará en cuenta el ultimo valor, dato, etc.

rango = ("a1".."d4")
puts rango.class
rango.each{ |i| puts i}
puts 
range = (1...11)
puts range.class
range.each{ |h| puts h}