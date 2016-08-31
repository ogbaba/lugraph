require "lugraph"


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

lugraph.draw("caca.ppm",64,64,64,64,5,5,foo,foo2,foo3,foo4,foo5,foo6,foo7,foo8)
