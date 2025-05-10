FightState = Class{__includes = BaseState}

function FightState:enter(def)
    self.fighterLeft = def.Fighter1
    self.fighterRight = def.fighter2
end

function FightState:init()
end

function FightState:update(dt)
    if love.keyboard.wasPressed('escape') then
        love.event.quit
    end
end

function FightState:render()
end