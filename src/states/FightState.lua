FightState = Class{__includes = BaseState}

function FightState:enter(def)
    self.fighterLeft = def.Fighter1
    self.fighterRight = def.Fighter2

    self.fighterRight.x = VIRTUAL_WIDTH-16
end

function FightState:init()
end

function FightState:update(dt)
    if love.keyboard.wasPressed('escape') then
        love.event.quit()
    end
    self.fighterLeft:update()
    self.fighterRight:update()

    if love.keyboard.isDown('left') then
        self.fighterLeft.x = math.max((self.fighterLeft.x - CHARACTER_SPEED*dt), 0)
    elseif love.keyboard.isDown('right') then
        self.fighterLeft.x = math.min((self.fighterLeft.x + CHARACTER_SPEED*dt), VIRTUAL_WIDTH-16)
    end

    if love.keyboard.isDown('a') then
        self.fighterRight.x = math.max((self.fighterRight.x - CHARACTER_SPEED*dt), 0)
    elseif love.keyboard.isDown('d') then
        self.fighterRight.x = math.min((self.fighterRight.x + CHARACTER_SPEED*dt), VIRTUAL_WIDTH-16)
    end

end

function FightState:render()
    self.fighterLeft:render()
    self.fighterRight:render()
end