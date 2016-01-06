# 
i = gets.chomp.to_i
value = case i 
	when 1 then "uno"
	when 2 then "dos"
	when 3 then "tres"
	when 4 then "cuatro"
	when 5 then "cinco"
	else "otro"
end

puts "el valor es #{value}"