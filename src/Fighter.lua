Fighter = Class{}

-- serial, name, x, y, width, height, img
function Fighter:init(params)
    self.serial = params.serial
    self.name = params.name
    
    self.x = params.x
    self.y = params.y
    self.width = params.width
    self.height = params.height
    self.dy = 0

    self.img = params.img

    self.orientation = 'left'

    self.anim = params.anim

    idleAnimation = Animation {
        frames = {1},
        interval = 1
    }

    movingAnimation = Animation {
        frames = {10, 11},
        interval = 0.2
    }

    jumpAnimation = Animation {
        frames = {3},
        interval = 1
    }

    self.currentAnimation = idleAnimation

    self.isOnGround = true
end

function Fighter:update(dt)

    self.dy = self.dy + GRAVITY
    self.y = self.y + (self.dy)*dt

    if self.y > VIRTUAL_HEIGHT/2 - self.width/2 then
        self.y = VIRTUAL_HEIGHT/2 - self.width/2
        self.dy = 0
        self.isOnGround = true
    else
        self.isOnGround = false
    end

    self.currentAnimation:update(dt)

    if self.orientation == 'left' then
        if love.keyboard.isDown('a') then
            self.x = math.max((self.x - CHARACTER_SPEED*dt), 0)
            self.currentAnimation = movingAnimation
        elseif love.keyboard.isDown('d') then
            self.x = math.min((self.x + CHARACTER_SPEED*dt), VIRTUAL_WIDTH-16)
            self.currentAnimation = movingAnimation
        elseif love.keyboard.wasPressed('w') and self.dy == 0 then
            self.dy = JUMP_VELOCITY
            self.currentAnimation = jumpAnimation
        else
            self.currentAnimation = idleAnimation
        end
        
    elseif self.orientation == 'right' then
        if love.keyboard.isDown('left') then
            self.x = math.max((self.x - CHARACTER_SPEED*dt), 0)
            self.currentAnimation = movingAnimation
        elseif love.keyboard.isDown('right') then
            self.x = math.min((self.x + CHARACTER_SPEED*dt), VIRTUAL_WIDTH-16)
            self.currentAnimation = movingAnimation
        elseif love.keyboard.isDown('space') and self.dy == 0 then
            self.dy = JUMP_VELOCITY
            self.currentAnimation = jumpAnimation
        else
            self.currentAnimation = idleAnimation
        end
    end
end

function Fighter:render()
    love.graphics.draw(gCharacterSheet, gCharacterQuads[self.currentAnimation:getCurrentFrame()], self.x, self.y, 0, self.orientation == 'right' and -1 or 1, 1)
end