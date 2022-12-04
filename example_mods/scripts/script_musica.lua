--created by sloow

function onCreate()
    --imagem
    makeLuaSprite('fun', 'minecraft', -500, 300) -- 0
    addLuaSprite('fun')
    setObjectCamera('fun', 'hud')
    scaleObject('fun', 1.1, 1.1)
    --texto
    makeLuaText('ff', songName, 400, -305) -- 0
    setTextAlignment('ff', 'left')
    setTextSize('ff', 40)
    addLuaText('ff')
end

function onStepHit()
    if curStep == 1 then
        doTweenY('ffytween', 'ff', 318, 0.01, linear)
    end
    if curStep == 3 then
        doTweenX('funxtween', 'fun', -60, 0.6, linear)
        doTweenX('ffxtween', 'ff', 8, 0.6, linear)
    end
    if curStep == 32 then
        doTweenAlpha('funtween', 'fun', 0, 0.7, linear)
        doTweenAlpha('fftween', 'ff', 0, 0.7, linear)
        doTweenX('funxtween', 'fun', -500, 0.6)
        doTweenX('ffxtween', 'ff', -300, 0.6, linear)
    end
end