Background = {}

function Background:load()
	self.vim = love.graphics.newImage("assets/background.png")
end

function Background:update(dt) end

function Background:draw()
	love.graphics.draw(self.vim, 0, 0)
end
