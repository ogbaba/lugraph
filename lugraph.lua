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
	--Quadrillaginos
	
	for i=1,left/(5*scaleX) do
		x = left - i*(5*scaleX)
		if x>0 then
		for j=1,sizeY do
			drawPoint(x,j,10,10,10)
		end
	end
	end
	
	for i=1,right/(5*scaleX) do
		x = left + i*(5*scaleX)
		if x<sizeX then
		for j=1,sizeY do
			drawPoint(x,j,10,10,10)
		end
	end
	end
	
	for i=1,up/(5*scaleY) do
		x = up - i*(5*scaleY)
		if x<sizeY then
		for j=1,sizeX do
			drawPoint(j,x,10,10,10)
		end
	end
	end
	
	for i=1,down/(5*scaleY) do
		x = up + i*(5*scaleY)
		if x>0 then
		for j=1,sizeX do
			drawPoint(j,x,10,10,10)
		end
	end
	end

	
	
	--Axis
	for i=1,sizeX do
	drawPoint(i,down,0,0,0)
	end
	for i=1,sizeY do
	drawPoint(left,i,0,0,0)
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
			if y<sizeY and y>0 then
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
	for j=1,sizeY do
		for i=1,sizeX do
			file:write(string.format("%d %d %d  ",map[j][i][1],map[j][i][2],map[j][i][3]))
		end
		file:write(string.format("\n"))
	end
	
	io.close()
end

return lugraph
