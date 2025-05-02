Player = {}

function Player:load()
	self.x = 50
	self.y = love.graphics.getHeight() / 2 --NOTE: Sætter objekt i midten af vindue-højde
	self.width = 20
	self.height = 100
	self.speed = 500 --NOTE: Player kan bevæge sig med 500 pixels i sekundet
end

function Player:update(dt)
	self:move(dt)
	self:checkBoundaries()
end

function Player:move(dt)
	-- NOTE: isDown forståes som at "knappen er presset ned"
	-- i en konstant fart lige meget hvor hurtig computeren er
	-- ganget med deltatime (dt) for at sikre spilleren bevæger sig
	if love.keyboard.isDown("k") then
		self.y = self.y - self.speed * dt
	elseif love.keyboard.isDown("j") then
		self.y = self.y + self.speed * dt
	end
end

function Player:checkBoundaries()
	-- Check for top og bund af vinduet
	if self.y < 0 then
		self.y = 0
	elseif self.y + self.height > love.graphics.getHeight() then
		self.y = love.graphics.getHeight() - self.height
	end
end

function Player:draw()
	love.graphics.rectangle("fill", self.x, self.y, self.width, self.height)
end
