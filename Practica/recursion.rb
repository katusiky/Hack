def my_factorial number
	if number > 1
		number *  my_factorial(number-1)
	else
		1
	end
end

puts my_factorial(1)