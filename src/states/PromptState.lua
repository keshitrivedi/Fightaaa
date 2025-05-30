PromptState = Class{__includes = BaseState}

function PromptState:enter(def)
    self.fighterNumber = def.fighterNumber
    self.xlabel = -100

    Timer.tween(0.25, {
        [self] = {xlabel = 0}
    }):finish(function()
        Timer.after(1, function()
            Timer.tween(0.25, {
                [self] = {xlabel = VIRTUAL_WIDTH + 10}
            }):finish(function()
                gStateMachine:change('choose', {fighters = fighters, fighterToBeSelected = self.fighterNumber})
            end)
        end)
    end)
end

function PromptState:init()
    self.xlabel = -50
end

function PromptState:update(dt)
    Timer.update(dt)

    if love.keyboard.wasPressed('escape') then
        love.event.quit()
    end
end

function PromptState:render()
    love.graphics.printf("Choose Fighter " .. tostring(self.fighterNumber), self.xlabel, VIRTUAL_HEIGHT/4, VIRTUAL_WIDTH, 'center')
end