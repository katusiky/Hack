def myFactorial number
	if number > 1
		number *  myFactorial(number-1)
	else
		1
	end
end

puts myFactorial(1)
