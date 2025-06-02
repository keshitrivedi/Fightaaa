love.graphics.setDefaultFilter('nearest', 'nearest')
require 'src/Dependencies'

function love.load()
    math.randomseed(os.time())

    push:setupScreen(VIRTUAL_WIDTH, VIRTUAL_WIDTH, WINDOW_WIDTH, WINDOW_HEIGHT, {
        fullscreen = false,
        vsync = true,
        resizable = true,
        canvas = false
    })

    gStateMachine = StateMachine {
        ['start'] = function() return StartState() end,
        ['prompt'] = function() return PromptState() end,
        ['choose'] = function() return ChooseFighterState() end,
        ['Fight'] = function() return FightState() end
    }

    gCharacterSheet = love.graphics.newImage('graphics/character.png')
    gCharacterQuads = GenerateQuads(gCharacterSheet, 16, 20)

    gChooseSheet = love.graphics.newImage('graphics/chooseanim.jpg')
    gChooseQuads = GenerateQuads(gChooseSheet, 100, 150)

    fighters = {
        Fighter(1, 'f1', 0, 0, 16, 20, gCharacterQuads[1]),
        Fighter(2, 'f2', 0, 0, 16, 20, gCharacterQuads[1]),
        Fighter(3, 'f3', 0, 0, 16, 20, gCharacterQuads[1])
    }

    -- gStateMachine:change('choose', {fighters = fighters})

    gStateMachine:change('start')

    love.keyboard.keysPressed = {}
end

function love.keypressed(key)
    love.keyboard.keysPressed[key] = true
end

function love.keyboard.wasPressed(key)
    if love.keyboard.keysPressed[key] then
        return true
    else 
        return false
    end
end

function love.update(dt)
    gStateMachine:update(dt)
    love.keyboard.keysPressed = {}
end

function love.draw()
    push:start()
    love.graphics.setBackgroundColor(150, 150, 150)
    gStateMachine:render()
    push:finish()
end