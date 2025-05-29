Fighter = Class{}

function Fighter:init(serial, name, x, y, width, height, img)
    self.serial = serial
    self.name = name
    
    self.x = x
    self.y = y
    self.width = width
    self.height = height

    self.img = img

    self.orientation = 'left'
end

function Fighter:update(dt)
end

function Fighter:render()
    love.graphics.draw(gCharacterSheet, gCharacterQuads[1], self.x, 0)
end

