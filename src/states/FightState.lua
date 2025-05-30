FightState = Class{__includes = BaseState}

function FightState:enter(def)
    self.fighterLeft = def.Fighter1
    self.fighterRight = def.Fighter2

    self.fighterRight.x = VIRTUAL_WIDTH-16
    self.fighterRight.orientation = 'right'
end

function FightState:init()
end

function FightState:update(dt)
    if love.keyboard.wasPressed('escape') then
        love.event.quit()
    end
    self.fighterLeft:update(dt)
    self.fighterRight:update(dt)

end

function FightState:render()
    self.fighterLeft:render()
    self.fighterRight:render()
end