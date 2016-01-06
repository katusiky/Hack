=begin
a = ("a".."h").to_a.shuffle.sort.sample
puts a.to_s
=end 

=begin
a = ("cbaa".."cbdd").to_a
a.delete ("cbab")
=end 

=begin
a= ["cara","carc","cara","carc"]
puts "#{a.sort}"
=end

a= []
b= (1..8).to_a
a.push(b)
puts a.to_s