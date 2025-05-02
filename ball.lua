Ball = {}

function Ball:load()
	self.x = love.graphics.getWidth() / 2
	self.y = love.graphics.getHeight() / 2
	self.img = love.graphics.newImage("assets/vim-ball.png")
	self.width = self.img:getWidth()
	self.height = self.img:getHeight()
	self.speed = 200
	self.xVel = -self.speed -- Går mod spilleren i starten
	self.yVel = 0
end

function Ball:update(dt)
	self:move(dt)
	self:collide()
	self:playerCollision()
	self:AICollision()
end

function Ball:collide()
	-- Håndter collision med top og bund af vindue
	if self.y < 0 then
		self.y = 0
		self.yVel = -self.yVel
	elseif self.y + self.height > love.graphics.getHeight() then
		self.y = love.graphics.getHeight() - self.height
		self.yVel = -self.yVel
	end

	-- If AI scores
	if self.x < 0 then
		self.x = love.graphics.getWidth() / 2 - self.width / 2
		self.y = love.graphics.getHeight() / 2 - self.height / 2
		self.yVel = 0
		self.xVel = self.speed
	end

	-- If player scores
	if self.x + self.width > love.graphics.getWidth() then
		self.x = love.graphics.getWidth() / 2 - self.width / 2
		self.y = love.graphics.getHeight() / 2 - self.height / 2
		self.yVel = 0
		self.xVel = -self.speed
	end
end

function Ball:playerCollision()
	if CheckCollision(self, Player) then
		self.xVel = self.speed
		-- Lav udsving op og ned når bolden rammer
		local middleBall = self.y + self.height / 2
		local middlePlayer = Player.y + Player.height / 2
		local collisionPosition = middleBall - middlePlayer
		self.yVel = collisionPosition * 5 -- Større variable giver større udsving
	end
end

function Ball:AICollision()
	if CheckCollision(self, AI) then
		self.xVel = -self.speed
		-- Lav udsving op og ned når bolden rammer
		local middleBall = self.y + self.height / 2
		local middleAI = AI.y + Player.height / 2
		local collisionPosition = middleBall - middleAI
		self.yVel = collisionPosition * 5 -- Større variable giver større udsving
	end
end

function Ball:move(dt)
	self.x = self.x + self.xVel * dt
	self.y = self.y + self.yVel * dt
end

function Ball:draw()
	love.graphics.draw(self.img, self.x, self.y)
end
