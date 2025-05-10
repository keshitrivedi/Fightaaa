StartState = Class{__includes = BaseState}

function StartState:init()
    self.timer = 0
    self.interval = 0.5
    self.totalBars = 5
    self.currBar = 1
end

function StartState:update(dt)
    self.timer = self.timer + dt

    if self.currBar <= self.totalBars and self.timer >= self.interval then
        self.timer = self.timer - self.interval
        self.currBar = self.currBar + 1
    end

    if self.currBar > self.totalBars then
        -- gStateMachine:change('choose', {
        --     fighters = fighters
        -- })

        gStateMachine:change('prompt', {fighterNumber = 1})
    end

    if love.keyboard.wasPressed('escape') then
        love.event.quit()
    end
end

function StartState:render()
    local x = 28
    for i = 1, self.currBar do
        love.graphics.rectangle('fill', x, VIRTUAL_WIDTH/2, 16, 16)

        x = x + 18
    end
end