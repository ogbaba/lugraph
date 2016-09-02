local lugraph = require "lugraph"


foo = function (x)
	return x+1
end
foo2 = function (x)
	return x*x
end
foo3 = function(x)
	return x*x*x
end
foo4 = function(x)
	return math.sqrt(x*x)
end
foo5 = function(x)
	return math.sin(x)*5
end
foo6 = function(x)
	return math.floor(x)
end
foo7 = function(x)
	return math.sqrt(x)
end
foo8 = function(x)
	return math.sin(x) * math.exp(x)
end

foo9 = function(x)
	local r
	if x < 0 then 
		r = x*x 
	else 
		r = -x 
	end
	return r
end

foo10 = function(x)
	return -(x*x)%10 + 10
end
lugraph.draw("test1.ppm",64,64,64,64,5,5,foo,foo2,foo3,foo4,foo5,foo6,foo7,foo8)
lugraph.draw("test2.ppm",1920/2,1920/2,1080/2,1080/2,19,11,foo,foo9,foo10)
