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

    gChooseSheet = love.graphics.newImage('graphics/chooseanimpng2.png')
    gChooseQuads = GenerateQuads(gChooseSheet, 100, 150)

    fighters = {
        Fighter({serial = 1, name = 'f1', x = 0, y = 0, width = 16, height = 20, img = gCharacterQuads[1], anim = Animation {frames = {1, 2}, interval = 1}}),
        Fighter({serial = 2, name = 'f2', x = 0, y = 0, width = 16, height = 20, img = gCharacterQuads[1], anim = Animation {frames = {3, 4, 5, 6}, interval = 0.3}}),
        Fighter({serial = 3, name = 'f3', x = 0, y = 0, width = 16, height = 20, img = gCharacterQuads[1], anim = Animation {frames = {7, 8, 9, 10}, interval = 0.4}})
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