#rangos: con dos puntos(..) agarrará todos los valores del rango y con tres puntos("...") no tomará en cuenta el ultimo valor, dato, etc.

rango = ("hola1".."hola4")
puts rango.class
rango.each{ |i| print i.to_s}
puts 
range = (1...11)
puts range.class
range.each{ |h| puts h.to_s}