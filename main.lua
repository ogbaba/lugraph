local lugraph = {}

function lugraph.draw(filename,left,right,up,down,scaleX,scaleY, ... )
	file = io.open(filename,"w")
	sizeX = right + left
	sizeY = up + down
	map = {}
	--Map gen
	for i=1,sizeY do
		map[i] = {}
		for j=1,sizeX do
			map[i][j] = {15,15,15}
		end
	end
	function rxtory(x,f)
		xb = (x-left)/scaleX
		y = -f(xb)*scaleY + up
		return y
	end
	function drawPoint(x,y,r,g,b)
		map[y][x] = {r,g,b}
	end
	--Drawing the shit
	--Columns
	for i = 1, (sizeX / 5 + 1)  / scaleX do
		x = (i*scaleX * 5)  - left%5
		if x>0 and x<sizeX then
			for j= 1,sizeY do
				drawPoint(x,j,10,10,10)
			end
		end
	end
	--Lines
	for i = 1, (sizeY / 5 + 1) / scaleY do
		x = (i*scaleY * 5) - up%5
			if x>0 and x<sizeX then
				for j=1,sizeX do
					drawPoint(j,x,10,10,10)
				end
	
			end
	end
	--Axis
	for i=1,sizeX do
	drawPoint(down,i,0,0,0)
	end
	for i=1,sizeY do
	drawPoint(i,left,0,0,0)
	end
	--Function
	for i,v in ipairs({...}) do
		if i == 1 then r = 15;g = 0;b =0 
		elseif i == 2 then r = 0;g =0;b =15 
		elseif i == 3 then r = 0;g = 15;b =0 
		elseif i == 4 then r = 15;g = 7;b =7 
		elseif i == 5 then r = 7;g = 15;b =7 
		elseif i == 6 then r = 7;g = 7;b =15
		else 
		math.randomseed(os.time())
		r = math.random(0,15)
		g = math.random(0,15)
		b = math.random(0,15)
		end
		for x=1,sizeX do
	
			y=rxtory(x,v)
			if y<sizeY and y>1 then
			drawPoint(x,math.floor(y),r,g,b)
			print(x,y)
			end
		end
	end
	--Writing the Header
	file:write(string.format("P3\n%d %d\n%d\n",sizeX,sizeY,15))
	--for i=1 , #map do
	--	print(map[i])
	--	print(map[i][1],map[i][2],map[i][3])
	--end

	--Writing the image
	for i=1,sizeX do
		for j=1,sizeY do
			file:write(string.format("%d %d %d  ",map[i][j][1],map[i][j][2],map[i][j][3]))
		end
		file:write(string.format("\n"))
	end
	
	io.close()
end
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
lugraph.draw("caca.ppm",100,100,100,100,10,10,foo,foo2,foo3,foo4,foo5)
