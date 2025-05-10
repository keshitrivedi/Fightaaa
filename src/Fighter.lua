Fighter = Class{}

function Fighter:init(serial, name, x, y, width, height)
    self.serial = serial
    self.name = name
    
    self.x = x
    self.y = y
    self.width = width
    self.height = height

    self.orientation = 'left'
end

function Fighter:update(dt)
end

function Fighter:checkCollision(rect, object)
    if (rect.x + rect.width > object.x) and (rect.y + rect.height > object.y) and self.orientation == 'left' then
        return true
    end

    if (object.x + object.width > rect.x) and (object.y + object.height > rect.y) and self.orientation == 'right' then
        return true
    end
    return false
end

function Fighter:checkHit(object)
    hitrect = {
        x = self.x,
        y = self.y,
        width = self.width,
        height = self.height
    }

    if self:checkCollision(hitrect, object) then
        return true
    end
end

function Fighter:checkHurt()
    hurtrect = {
        x = self.x,
        y = self.y,
        width = self.width,
        height = self.height
    }

    if self:checkCollision(hurtrect, object) then
        return true
    end
end

function Fighter:render()
end

