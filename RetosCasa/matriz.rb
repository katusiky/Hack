array = []

10.times{ |y| array[y] = []
	       10.times{ |x| array[y].insert(x , rand(50)) 
	       			} 
	    }  
puts array.to_s