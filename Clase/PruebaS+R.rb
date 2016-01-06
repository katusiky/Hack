i = (rand(70))

value = case i 
	when 1..10 then "uno"
	when 11..30 then "dos"
	when 31..40 then "tres"
	when 41..50 then "cuatro"
	when 51..60 then "cinco"
	else "otro"
end

puts value
puts