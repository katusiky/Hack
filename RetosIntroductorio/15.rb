puts "ingresa frase"

palindrome = gets.chomp.to_s

if palindrome == palindrome.reverse
	puts "Soy Gay"
end

puts palindrome.reverse