ChooseFighterState = Class{__includes = BaseState}

gFighter1 = {}
gFighter2 = {}

function ChooseFighterState:enter(params)
    self.options = self.options or params.fighters
    self.fighterToBeSelected = params.fighterToBeSelected or 1
end

function ChooseFighterState:init()
    self.currentFighter = 1
end

function indexOf(tbl, val)
    for i, v in ipairs(tbl) do
        if v == val then
            return i
        end
    end
end

function ChooseFighterState:update(dt)

    if love.keyboard.wasPressed('escape') then
        love.event.quit()
    end

    if love.keyboard.wasPressed('left') then
        if self.currentFighter ~= 1 then
            self.currentFighter = self.currentFighter - 1
        else 
            self.currentFighter = #self.options
        end
    elseif love.keyboard.wasPressed('right') then
        if self.currentFighter ~= #self.options then
            self.currentFighter = self.currentFighter + 1
        else
            self.currentFighter = 1
        end
    end

    if love.keyboard.wasPressed('return') then
        if self.fighterToBeSelected == 1 then
            gFighter1 = self.options[self.currentFighter]
            self.fighterToBeSelected = 2

            if gFighter1 then
                table.remove(self.options, indexOf(self.options, gFighter1))
            end
            gStateMachine:change('prompt', {fighterNumber = 2})
        else
            gFighter2 = self.options[self.currentFighter]
            gStateMachine:change('Fight', {Fighter1 = gFighter1, Fighter2 = gFighter2})
        end
    end
end

function ChooseFighterState:render()
    love.graphics.print(tostring(self.options[self.currentFighter].name))
    love.graphics.printf(tostring(gFighter1.name), 0, VIRTUAL_HEIGHT/4, VIRTUAL_WIDTH, 'center')
    love.graphics.printf(tostring(gFighter2.name), 0, VIRTUAL_HEIGHT/3, VIRTUAL_WIDTH, 'center')
end