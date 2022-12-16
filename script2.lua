local allowCountdown = false

local SecondColor = '0xFFFFFFFF' -- Color of The Selector and text
local Color = '0xFF2A0659'-- Color of the Background

--  You Can Change The Sounds If you don't Want to get Sued By Nintendo.

local WarningSound = 'SwitchSounds/error'
local ConfirmSound = 'SwitchSounds/popup+runtitle'
local BackOutSound = 'SwitchSounds/standby'
local SelectSound = 'SwitchSounds/thisone'
local AutoSelectSound = 'SwitchSounds/turnon'
local BorderHit = 'SwitchSounds/border'
local MessageStateMusic = ''

local WarningMessage = 'You have made a mistake.'
local ConfirmText = 'Brave'
local ExitText = 'Coward'


function onStartCountdown()
	if not allowCountdown and not seenCutscene then
        ContolsEnabled = false
        runTimer('RedScreen',1)
        doTweenAlpha('cam1','camHUD',0,0.1,'linear')
        makeLuaSprite('RedThing','',0,0)
        makeGraphic('RedThing',1280,720,Color)
        setObjectCamera('RedThing','camOther')
        addLuaSprite('RedThing')
        doTweenAlpha('RedAlpha1','RedThing',0,0.1,'linear')
        makeLuaSprite('Thingy','Vignette',0,0) -- You can Add a Vignette Overlay Here.
        setObjectCamera('Thingy','camOther')
        addLuaSprite('Thingy',true)
        doTweenAlpha('Black','Thingy',0,0.001,'linear')
        makeLuaSprite('OptionBox2BG','',497,1592)
        makeGraphic('OptionBox2BG',300,45,'000000')
        setProperty('OptionBox2BG.alpha',0.8)
        addLuaSprite('OptionBox2BG')
        setObjectCamera('OptionBox2BG','camOther')
        makeLuaSprite('OptionBox1BG','',497,1492)
        makeGraphic('OptionBox1BG',300,45,'000000')
        setProperty('OptionBox1BG.alpha',0.8)
        addLuaSprite('OptionBox1BG')
        setObjectCamera('OptionBox1BG','camOther')
        makeLuaSprite('OptionBoxLB','',492,1490)
        makeGraphic('OptionBoxLB',5,50,SecondColor)
        setProperty('OptionBoxLB.alpha',0.8)
        addLuaSprite('OptionBoxLB')
        setObjectCamera('OptionBoxLB','camOther')
        makeLuaSprite('OptionBoxRB','',791,1490)
        makeGraphic('OptionBoxRB',6,50,SecondColor)
        setProperty('OptionBoxRB.alpha',0.8)
        addLuaSprite('OptionBoxRB')
        setObjectCamera('OptionBoxRB','camOther')
        makeLuaSprite('OptionBoxTB','',497,1490)
        makeGraphic('OptionBoxTB',294,5,SecondColor)
        setProperty('OptionBoxTB.alpha',0.8)
        addLuaSprite('OptionBoxTB')
        setObjectCamera('OptionBoxTB','camOther')
        makeLuaSprite('OptionBoxBB','',497,1535)
        makeGraphic('OptionBoxBB',294,5,SecondColor)
        setProperty('OptionBoxBB.alpha',0.8)
        addLuaSprite('OptionBoxBB')
        setObjectCamera('OptionBoxBB','camOther')
        doTweenAlpha('FBdAas','OptionBox1BG',0,01.5,'linear')
        doTweenAlpha('FBdasA','OptionBox2BG',0,01.5,'linear')
        doTweenAlpha('FBasasasdA','OptionBoxLB',0,0.001,'linear')
        doTweenAlpha('FBasasadA','OptionBoxRB',0,0.001,'linear')
        doTweenAlpha('FBdasasA','OptionBoxBB',0,0.001,'linear')
        doTweenAlpha('TopBorderAlpha','OptionBoxTB',0,0.001,'linear')

        makeLuaText('FirstBody','WARNING: '..WarningMessage,800,250,300) -- Texts Are Here.
        makeLuaText('Confirm',ConfirmText,300,500,700)
        makeLuaText('EsC',ExitText,300,500,900)
        
        setTextSize('FirstBody',30)
        setTextSize('Confirm',20)
        setTextSize('EsC',20)
        addLuaText('FirstBody')
        addLuaText('Confirm')
        addLuaText('EsC')
        setObjectCamera('FirstBody','camOther')
        setObjectCamera('Confirm','camOther')
        setObjectCamera('EsC','camOther')
        doTweenAlpha('FBA','FirstBody',0,0.001,'linear')
        doTweenAlpha('CA','Confirm',0,0.001,'linear')
        doTweenAlpha('ESCA','EsC',0,0.001,'linear')

		return Function_Stop
	end
	return Function_Continue
end
function onCountdownTick(counter)
    if counter == 0 then
        doTweenAlpha('cam1','camHUD',1,0.5,'linear')
    end
end
function onUpdate(elapsed)
    MessageStateMusicVolume = 0.3

	if not allowCountdown and (getPropertyFromClass('flixel.FlxG', 'keys.justPressed.ENTER')) and ContolsEnabled == true and not startedCountdown then
        if ExitButton == true then 
            doTweenAlpha('Darkness','camOther',0,0.1,'linear')
            doTweenAlpha('Like','camHUD',0,0.1,'linear')
            doTweenAlpha('Soul','camGame',0,0.1,'linear')
            ContolsEnabled = false
            playSound(BackOutSound)
            endSong()
        end
        if StartButton == true then 
            ContolsEnabled = false
            allowCountdown = true 
            playSound(ConfirmSound)
            cameraFlash('camOther','0xffffff', 1, true)
            runTimer('Confirm',0.5)    
            runTimer('Start',0.7)
        end
	end
    if getPropertyFromClass('flixel.FlxG', 'keys.justPressed.UP') and ContolsEnabled == true then
        StartButton = true
        ExitButton = false
        if not startedCountdown then
            playSound(SelectSound,1)
            setTextColor('Confirm',SecondColor)
            setTextColor('EsC','0xffffff')
            doTweenAlpha('FBasasasdA','OptionBoxLB',1,0.1,'linear')
            doTweenAlpha('FBasasadA','OptionBoxRB',1,0.1,'linear')
            doTweenAlpha('FBdasasA','OptionBoxBB',1,0.1,'linear')
            doTweenAlpha('TopBorderAlpha','OptionBoxTB',1,0.1,'linear')
            doTweenY('SlectorLB','OptionBoxLB',490,0.1,'quartInOut')
            doTweenY('SlectorRB','OptionBoxRB',490,0.1,'quartInOut')
            doTweenY('SlectorTB','OptionBoxTB',490,0.1,'quartInOut')
            doTweenY('SlectorBB','OptionBoxBB',535,0.1,'quartInOut')

        end
    end
    if getPropertyFromClass('flixel.FlxG', 'keys.justPressed.DOWN') and ContolsEnabled == true then
        StartButton = false
        ExitButton = true
        if not startedCountdown then
            playSound(SelectSound,1)
            setTextColor('EsC',SecondColor)
            setTextColor('Confirm','0xffffff')
            doTweenAlpha('FBasasasdA','OptionBoxLB',1,0.1,'linear')
            doTweenAlpha('FBasasadA','OptionBoxRB',1,0.1,'linear')
            doTweenAlpha('FBdasasA','OptionBoxBB',1,0.1,'linear')
            doTweenAlpha('TopBorderAlpha','OptionBoxTB',1,0.1,'linear')
            doTweenY('SlectorLB','OptionBoxLB',590,0.1,'quartInOut')
            doTweenY('SlectorRB','OptionBoxRB',590,0.1,'quartInOut')
            doTweenY('SlectorTB','OptionBoxTB',590,0.1,'quartInOut')
            doTweenY('SlectorBB','OptionBoxBB',635,0.1,'quartInOut')    
        end
    end
end

function onTimerCompleted(name)
    if name == 'RedScreen' then 
        doTweenAlpha('RedAlpha1','RedThing',0.7,1,'quartInOut')
        doTweenAlpha('Black','Thingy',1,1,'quartInOut')
        runTimer('Sound',0.3)
        runTimer('Music',0.5)
        runTimer('AutoSelect',3)
        runTimer('Text',1)
    end
    if name =='Sound' then 
        playSound(WarningSound,1)
    end
    if name =='Music' then 
        playMusic(MessageStateMusic,MessageStateMusicVolume)
    end
    if name == 'Text' then 
        doTweenY('Sus1','FirstBody',100,1,'quartInOut')
        doTweenY('Sus2','Confirm',500,1,'quartInOut')
        doTweenY('Sus3','EsC',600,1,'quartInOut')
        doTweenY('Sus4','OptionBox1BG',492,0.8,'quartInOut')
        doTweenY('Sus5','OptionBox2BG',592,1,'quartInOut')
        doTweenY('BL','OptionBoxLB',490,1,'quartInOut')
        doTweenY('BT','OptionBoxTB',490,1,'quartInOut')
        doTweenY('BR','OptionBoxRB',490,1,'quartInOut')
        doTweenY('BB','OptionBoxBB',535,1,'quartInOut')
        doTweenAlpha('FBdAas','OptionBox1BG',0.7,1.5,'linear')
        doTweenAlpha('FBdasA','OptionBox2BG',0.7,1.5,'linear')
        doTweenAlpha('FBdA','FirstBody',1,1.5,'linear')
        doTweenAlpha('CAd','Confirm',1,1.5,'linear')
        doTweenAlpha('ESdCA','EsC',1,1.5,'linear')
    end
    if name == 'AutoSelect' then 
        playSound(AutoSelectSound,1)

        StartButton = false
        ExitButton = true
        ContolsEnabled = true 

        setTextColor('EsC',SecondColor)
        setTextColor('Confirm','0xffffff')

        doTweenAlpha('FBasasasdA','OptionBoxLB',1,0.1,'linear')
        doTweenAlpha('FBasasadA','OptionBoxRB',1,0.1,'linear')
        doTweenAlpha('FBdasasA','OptionBoxBB',1,0.1,'linear')
        doTweenAlpha('TopBorderAlpha','OptionBoxTB',1,0.1,'linear')

        doTweenY('SlectorLB','OptionBoxLB',590,0.01,'quartInOut')
        doTweenY('SlectorRB','OptionBoxRB',590,0.01,'quartInOut')
        doTweenY('SlectorTB','OptionBoxTB',590,0.01,'quartInOut')
        doTweenY('SlectorBB','OptionBoxBB',635,0.01,'quartInOut')
    end
    if name == 'Confirm' then 
        doTweenAlpha('RedAlpha1','RedThing',0,1,'linear')
        doTweenAlpha('Black','Thingy',0,1,'linear')
        doTweenAlpha('FBdA','FirstBody',0,1,'linear')
        doTweenAlpha('CAd','Confirm',0,1,'linear')
        doTweenAlpha('ESdCA','EsC',0,1,'linear')
        doTweenAlpha('FBdAas','OptionBox1BG',0,1,'linear')
        doTweenAlpha('FBdasA','OptionBox2BG',0,1,'linear')
        doTweenAlpha('FBasasasdA','OptionBoxLB',0,1,'linear')
        doTweenAlpha('FBasasadA','OptionBoxRB',0,1,'linear')
        doTweenAlpha('FBdasasA','OptionBoxBB',0,1,'linear')
        doTweenAlpha('TopBorderAlpha','OptionBoxTB',0,1,'linear')
    end
    if name == 'Start' then
        startCountdown()
    end
end
function onSongStart()
    removeLuaSprite('RedThing')
    removeLuaSprite('Thingy')
    removeLuaSprite('OptionBox1BG')
    removeLuaSprite('OptionBox2BG')
    removeLuaSprite('OptionBoxLB')
    removeLuaSprite('OptionBoxTB')
    removeLuaSprite('OptionBoxBB')
    removeLuaSprite('OptionBoxRB')
    removeLuaText('FirstBody')
    removeLuaText('Confirm')
    removeLuaText('EsC')
    removeLuaScript('SwitchStyleWarningStartScreen')
end

function onBeatHit()
	triggerEvent('Screen Shake','','0.1,0.010')

	windowY = getPropertyFromClass('openfl.Lib','application.window.y')
	windowX = getPropertyFromClass('openfl.Lib','application.window.x')
	setPropertyFromClass('openfl.Lib','application.window.x', windowX + getRandomInt(-20, 20))
	setPropertyFromClass('openfl.Lib','application.window.y', windowY + getRandomInt(-16, 16))
end

function opponentNoteHit()
	triggerEvent('Screen Shake','0.1,0.010','')

	setPropertyFromClass('openfl.Lib','application.window.x', windowX + getRandomInt(-40, 40))
	setPropertyFromClass('openfl.Lib','application.window.y', windowY + getRandomInt(-32, 32))

end

function goodNoteHit()
	getPropertyFromClass('openfl.Lib','application.window.y',setPropertyFromClass('openfl.Lib','application.window.y',180))
	getPropertyFromClass('openfl.Lib','application.window.x',setPropertyFromClass('openfl.Lib','application.window.x',320))
end


function onUpdate()
	
	--debugPrint('Window Position:',getPropertyFromClass('openfl.Lib','application.window.y'),' ',getPropertyFromClass('openfl.Lib','application.window.x'));
	
	if getPropertyFromClass('openfl.Lib','application.window.fullscreen', true) then 
		setPropertyFromClass('openfl.Lib','application.window.fullscreen',false)
	end
end

function onEndSong()
	getPropertyFromClass('openfl.Lib','application.window.y',setPropertyFromClass('openfl.Lib','application.window.y',180))
	getPropertyFromClass('openfl.Lib','application.window.x',setPropertyFromClass('openfl.Lib','application.window.x',320))
end



function onPause()
	-- Called when you press Pause while not on a cutscene/etc
	-- return Function_Stop if you want to stop the player from pausing the game
	return Function_Stop;
end

function onStartCountdown()
	getPropertyFromClass('openfl.Lib','application.window.fullscreen',setPropertyFromClass('openfl.Lib','application.window.fullscreen',false))
end

function onCreatePost() --script made by impostor, credit me now or i will do an unfunny (credit to imposter dude)
    makeLuaText("message", "OH NO YOU DON'T! Ghost tapping, Debug mode, Botplay, Practice mode, and pausing are all forced off. GIVE UP. https://m.youtube.com/watch?v=lfqCJfK153U&t=1215s", 500, 30, 50)
    setTextAlignment("message", "left")
    addLuaText("message")

    makeLuaText("engineText", " Universe Breaker  - Payten Edition Engine (PE "..version..")", 500, 30, 30)
    setTextAlignment("engineText", "left")
    addLuaText("engineText")

    if getPropertyFromClass('ClientPrefs', 'downScroll') == false then
        setProperty('message.y', 680)
        setProperty('engineText.y', 660)
    end
end

---@diagnostic disable: undefined-global
---@version 1.0.1.1 -- dunno what this is but its cool

-- TRAMPOLINE SCRIPT!!!
-- by aflac
--
-- WARNING:
-- offsets will  not  properly work
-- as of this version, if the character  changes position, it will  not look  good.
--
-- https://discord.gg/aflac

-- config

local jumpBind = "space"
local gravity = 32 -- gravity [default: 32]
local jumpheight = 1000
local neckbreak = 20 -- range from 180 degrees he can be from  breaking his neck, -1 if you want to disable it, default: 20

local DEBUG_MODE = false -- display information

local allowStylePoints = true -- disable if you don't want points  to be  awarded on things like flips
local safetyMode = true -- combo cant be lost on mustHitSections if true
local autoStart = true -- start  jumping on song start, otherwise start after space was pressed

local trampolineOffsets = { 0, 0 } -- offsets of  the trampoline sprite
-- { 0, 0 }     default
-- { 25, 75 }   car bf fix

-- do not touch from beyond here LOSER

--  TODOs:
--  score for doing flips
--  ability to jump higher
--  lots of style point system shits
--  idk make it so you can do the hey pose mid  air for points sometimes
--  i  also wanna make it so the gravity  can  sync the jump with  beats but idk

local bouncing = false
local jumping = false
local y = 0
local tilt = 0
local isPixelStaaagge = false
local lastBounceAng = 0
local styleRot = 0 -- rotation used  to tracking flips for style points
-- vv ok i  lied  you can  touch this one vv --
local points = {
    --  cool tricks,  reccomended t o keep low because combos multiply it
    -- format  is { enabled, score, text }
    lost      = { nil,  nil, "Combo lost!"}; -- isn't  a trick youcan do  its just f or  text
    backflip  = { true, 90, "Backflip!" };
    frontflip = { true, 90, "Frontflip!" }; -- just for funsies
    peak      = { true, 200, "!!!" };       -- pressing space at the peak of the bounce, why not? couldn't t hink  of a text
    highJump  = { true, 100, "!!" }; -- performing a "Very High" jump (timing down key press on land landing from a "high")
}
local combo = 0
local tricksLastBounce = 0
local lastJumpHeight = 0 -- -1 = mini jump, 0 = normal jump, 1 = big  jump
local isHeFuckingDead = false -- well, is he?
local songStarted = false -- prevent style point bullshit

local pressedSpaceOnBounce = false -- don't fuck this up
function centerOffsets(sprite, AdjustPosition)
    local offset = { x = 0, y = 0 }
    offset.x = (getProperty(sprite .. '.frameWidth') - getProperty(sprite .. '.width')) * 0.5
    offset.y = (getProperty(sprite .. '.frameHeight') - getProperty(sprite .. '.height')) * 0.5

    setProperty(sprite .. '.offset.x', offset.x)
    setProperty(sprite .. '.offset.y', offset.y)

    if AdjustPosition then
        setProperty(sprite .. '.x', getProperty(sprite .. '.x') + offset.x)
        setProperty(sprite .. '.y', getProperty(sprite .. '.y') + offset.y)
    end
end

function centerOrigin(sprite)
    setProperty(sprite .. '.origin.x', getProperty(sprite .. '.frameWidth') * 0.5)
    setProperty(sprite .. '.origin.y', getProperty(sprite .. '.frameHeight') * 0.5)
end

local function Lerp(a,b,x)
    return a + ((b - a) * x)
end

function onTimerCompleted(tag, loops, loopsLeft)
    if tag == "combo_timer" then
        setProperty("combo_label.velocity.y",getProperty('combo_label.velocity.y') + 40)
        setProperty("combo_counter.velocity.y",getProperty('combo_counter.velocity.y') + 40)
    end
    if tag == "combo_timer_fade" then
        doTweenAlpha("combo_timer_fade_label","combo_label",0,1,'quadIn')
        doTweenAlpha("combo_timer_fade_counter","combo_counter",0,1,'quadIn')
    end
end

local function centerSprite(sprite, center, axis)
    -- this function was written for thjis script, its very basic
    -- does not support  xy, it uses x  or y individually
    -- checks the actual properties

    local length = "width"
    if axis == "y" then
        length = "height"
    end

    setProperty(sprite .. "." .. axis,
        getProperty(center .. "." .. axis) + (getProperty(center .. "." .. length) / 2) -
        (getProperty(sprite .. "." .. length) / 2))
end

local function spawnComboThingy(thingy,points)
        cancelTimer("combo_timer")
        cancelTimer("combo_timer_fade")
        cancelTween("combo_timer_fade_label")
        cancelTween("combo_timer_fade_counter")

        setProperty('combo_label.x',screenWidth - screenWidth/2.5)
        setProperty('combo_counter.x',screenWidth - screenWidth/3)

        setProperty("combo_label.y",screenHeight/3)
        setProperty("combo_counter.y",screenHeight/3+ 38)

        setProperty('combo_label.alpha',1)
        setProperty('combo_counter.alpha',1)

        setTextString("combo_label",thingy)
        if points == 0  then
            points = ""
        else
            points = "(+"..points..")"
        end
        setTextString("combo_counter","x"..combo.." "..points)

        setProperty('combo_label.height',40)

        if not isPixelStaaagge then  -- make sure  it  isnt pixel stage because imo it looks bad with pixel font
            setTextSize("combo_label",40)
        setTextSize("combo_counter",25)
        end
        

        setProperty('combo_label.velocity.y',-100)
        setProperty('combo_counter.velocity.y',-100)

        runTimer('combo_timer',0.02,50)
        runTimer('combo_timer_fade',1)
end

function onCreatePost()
    ---luaDebugMode = true
    
    addHaxeLibrary('PlayState')

    if getPropertyFromClass('PlayState', 'isPixelStage') then
        isPixelStaaagge = true
    end
    math.randomseed(os.time())


    setProperty('botplayTxt.text', "boingb oi ng   boing o bin  go  ingingbgoibing")
    setProperty('boyfriend.y', getProperty('boyfriend.y') - 90)
    makeLuaSprite("trampoline", "trampoline",
        getProperty('boyfriend.x') + (getProperty('boyfriend.width') / 2) + trampolineOffsets[1],
        getProperty('boyfriend.y') + trampolineOffsets[2])
    if isPixelStaaagge then
        makeLuaSprite("trampoline", "pixel-trampoline",
            getProperty('boyfriend.x') + (getProperty('boyfriend.width') / 2) + trampolineOffsets[1],
            getProperty('boyfriend.y') + trampolineOffsets[2])
        scaleObject('trampoline', 6, 6)
        updateHitbox('trampoline')
    end

    makeLuaText("combo_label","Backflip!",400,0,0)
    addLuaText('combo_label')
    setObjectCamera("combo_label",'camHUD')
    setTextSize("combo_label",35)

    makeLuaText("combo_counter","x10",200,0,38)
    addLuaText('combo_counter')
    setObjectCamera("combo_counter",'camHUD')
    setTextSize("combo_counter",20)

    setProperty('combo_label.alpha',0)
    setProperty('combo_counter.alpha',0)

    setTextAlignment("combo_counter","left")

    addLuaSprite('trampoline', false)
    updateHitbox('trampoline')

    if isPixelStaaagge then
        setTextFont("combo_counter","pixel.otf")
        setTextFont("combo_label","pixel.otf")
    end

    centerSprite("trampoline", "boyfriend", "x")



    if isPixelStaaagge then
        setProperty('trampoline.x', getProperty('trampoline.x') - (getProperty('trampoline.width') / 2.5)) -- weird  bug
        setProperty('trampoline.antialiasing', false)
        setProperty('trampoline.y',
            getProperty('boyfriend.y') + (getProperty('boyfriend.height') / 1.75) -
            (getProperty('trampoline.height') / 2))
    else
        setProperty('trampoline.y',
            getProperty('boyfriend.y') + getProperty('boyfriend.height') - (getProperty('trampoline.height') / 2))
    end

    setProperty('trampoline.x', getProperty('trampoline.x') + trampolineOffsets[1])
    setProperty('trampoline.y', getProperty('trampoline.y') + trampolineOffsets[2])

    makeLuaText("debugTxt", "debug text  goes here", screenWidth / 3, 10, screenHeight / 3)
    setTextAlignment("debugTxt", "left")
    setObjectCamera('debugTxt', 'camOther')

    --setProperty('gf.visible', false) -- she gets in the way of  bfs epic trampolining  skills
    -- NEVERMIND  SHE IS  VERY GOOD  AT NOT GETTING IN HIS WAY  WHILE TRAMPOLINING!!!!!!
    --setProperty('botplayTxt.visible', true)
    setObjectOrder("trampoline", getObjectOrder('boyfriendGroup') - 1)

    if DEBUG_MODE then
        addLuaText("debugTxt")
    end

    if songName == "Senpai" then --  LORE
        if not jumping then
            y = getProperty('boyfriend.y') -- get the start point
            jumping = true
            bouncing = true
            setProperty('boyfriend.velocity.y', -jumpheight * 0.5) --  initial  jump is smaller  for  effect
        end
    end
end

-- makes sure bf  fdidnt break  his neck  in  a jump
-- if  he did  ooff ouchie ouuwwwww  my  neckk  aououuoutuutuuuuu it hurty!!
local function checkIfBrokeNeck()
    local angle = getProperty('boyfriend.angle') % 360

    if not (safetyMode and mustHitSection) then
        if tricksLastBounce == 0 then
            if not (combo == 0) then
                combo = 0
            spawnComboThingy(points.lost[3],0)
            else
                combo = 0
            end
        end
    end
    tricksLastBounce = 0

    lastBounceAng = angle
    styleRot = 0 -- because style is only gained during air time


    if neckbreak > -1 then -- make suyre breaking your neck  isnt disabled
        if angle < 180 + neckbreak and angle > 180 - neckbreak then
            if lastJumpHeight > -1 then -- smaller jumps wont kill you
                bouncing = false
                jumping = false
                setProperty('boyfriend.velocity.y', 0)
                setProperty('health', 0)
                isHeFuckingDead = true
            else if lastJumpHeight == -1 then
                    setProperty('health', getProperty("health") - 0.25)
                else
                    setProperty('health', getProperty("health") - 0.05)
                end
            end
        end
    end
end

function onSongStart()
    --debugPrint(getProperty('isPixelStage'))
    songStarted = true -- HI
    if autoStart then
        if not jumping then
            y = getProperty('boyfriend.y') -- get the start point
            jumping = true
            bouncing = true
            setProperty('boyfriend.velocity.y', -jumpheight * 0.5) --  initial  jump is smaller  for  effect
        end
    end
end

function onUpdate(elapsed)
    -- elapsed gets used a lot here to make sure that if a mod
    -- has a faster update speed or smth or the player has a
    -- shitty pc, the trampoline will still behave corrcetly
    -- and not lag behind or be super slow. haven't tested it
    -- but this computer im using is 7 years oldS

    --runHaxeCode([[boyfriend.centerOrigins();]]) -- does not work, reminder to try to fix
    -- FUCK Y OU I  FIXED  IT!!! (kinda)
    centerOrigin("boyfriend")

    --setProperty("combo_label.height",Lerp(getProperty('combo_label.height'),35,0.2)  * elapsed)
setTextSize("combo_label",Lerp(getTextSize("combo_label"),35,0.2 * (elapsed * 0.2)))
setTextSize("combo_counter",Lerp(getTextSize("combo_counter"),20,0.2 * (elapsed * 0.2)))
    --setProperty('combo_label.y',getProperty('combo_label.y') + getProperty('combo_label.velocity.y')  * elapsed)
    --setProperty('combo_counter.y',getProperty('combo_counter.y') + getProperty('combo_counter.velocity.y')  * elapsed)

    if not jumping then
        if keyPressed(jumpBind) then
            y = getProperty('boyfriend.y') -- get the start point
            setProperty('boyfriend.velocity.y', -jumpheight * 0.5)
            jumping = true
            bouncing = true

        end
    else
        -- for  if jumping, handle the jump height n shits
        if keyJustPressed("space") then
            if not pressedSpaceOnBounce then
                if points.peak[1] then
                    if getProperty('boyfriend.velocity.y') > -300 and getProperty('boyfriend.velocity.y') < 300 then
                        triggerEvent("Hey!", "", "")
                        addScore(points.peak[2])
                        combo =  combo + 1
                        tricksLastBounce  = tricksLastBounce + 1 -- SAFE
                        spawnComboThingy(points.peak[3],points.peak[2])
                        
                    end
                end
            end
            pressedSpaceOnBounce = true
        end

        if getProperty('boyfriend.y') >= y then
            checkIfBrokeNeck()
            if bouncing then
                setProperty('boyfriend.y', y)
                jumping = true
                pressedSpaceOnBounce = false -- a new bounce
                local lastlastjumpheight = lastJumpHeight

                lastJumpHeight = 0
                if lastlastjumpheight == 2 then
                    lastJumpHeight = 1
                end

                local additional = 0
                if keyPressed("up") then
                    additional = jumpheight * 0.25
                    lastJumpHeight = 1


                end
                if keyPressed("down") then
                    if lastlastjumpheight == 1 then
                        additional = jumpheight * 0.5
                        lastJumpHeight = 2
                        lastlastjumpheight = 2 -- prevent conflict
                        if points.highJump[1] then
                            addScore(points.highJump[2])
                            -- spawnComboThingy(points.highJump[3])
                            --combo =  combo + 1 -- should not  count towards combo
                        end
                    elseif lastlastjumpheight == -1 or lastlastjumpheight == -2 then
                        additional = jumpheight * -0.2
                        lastJumpHeight = -2
                    else


                        additional = jumpheight * -0.05
                        lastJumpHeight = -1
                    end

                end

                if lastlastjumpheight == 1 then
                    additional = jumpheight * 0.25
                end

                playSound('boing')
                setProperty('boyfriend.velocity.y', -jumpheight + math.random(-50, 50) - additional)
            end
        else
            -- setProperty("boyfriend.velocity.x",getProperty('boyfriend.velocity.x')+50) -- https://twitter.com/aflaccck/status/1595932461082763264
            if keyPressed('left') then
                tilt = tilt - 0.5
            end
            if keyPressed('right') then
                tilt = tilt + 0.5
            end

            local additional = 0

            if keyPressed("down") then
                additional = 30
            end
            setProperty('boyfriend.velocity.y',
                getProperty('boyfriend.velocity.y') + (gravity + additional) * (elapsed * 40))
        end

    end

    -- flips system
    if allowStylePoints and songStarted then  -- disregard everything i said
        if styleRot >= 360 and points.backflip[1] then
            -- FUCCIN BACKFLIP
            combo            = combo + 1
            tricksLastBounce = tricksLastBounce + 1
            styleRot         = styleRot - 360
            addScore(points.backflip[2] * (combo * 1.1))
            triggerEvent("Hey!", "", "")
            spawnComboThingy(points.backflip[3],points.backflip[2] * (combo * 1.1))
        end
        if styleRot <= -360 and points.frontflip[1] then
            -- FUCCIN FRONTFLIP
            combo            = combo + 1
            styleRot         = styleRot + 360
            tricksLastBounce = tricksLastBounce + 1
            addScore(points.frontflip[2] * (combo * 1.1))
            triggerEvent("Hey!", "", "")
            spawnComboThingy(points.frontflip[3],points.frontflip[2] * (combo * 1.1))
        end
    end

    setProperty('boyfriend.angle', getProperty('boyfriend.angle') + tilt * (elapsed * 40))
    styleRot = styleRot + tilt * (elapsed * 40)

    tilt = tilt * 0.95

    local temptilt = math.abs(getProperty('boyfriend.angle')) % 360
    if getProperty('boyfriend.angle') < 0 then
        setProperty('boyfriend.angle', temptilt * -1)
    else
        setProperty('boyfriend.angle', temptilt)
    end

    if DEBUG_MODE then

        local SILLIES = "Normal"

        if lastJumpHeight == -2 then
            SILLIES = "Very low"
        elseif lastJumpHeight == -1 then
            SILLIES = "Low"
        elseif lastJumpHeight == 1 then
            SILLIES = "High"
        elseif lastJumpHeight == 2 then
            SILLIES = "Very high"
        end

        local join = "angle: " ..
            getProperty('boyfriend.angle') ..
            "\nlastBounceAng: " ..
            lastBounceAng ..
            "\nstyleRot: " ..
            styleRot ..
            "\ncombo: " ..
            combo .. "\nlastJumpHeight: " .. SILLIES .. "\nboyfriend.velocity.y: " .. getProperty('boyfriend.velocity.y')
        setTextString("debugTxt", join)
    end

end

function onUpdatePost()
    if isHeFuckingDead then
        setProperty('health', 0)
        -- NEVER ESCAPE.
    end
end

-- SCRIPT BY AFLAC --
-- rewritten about 10 times
-- offsets from the characters camera position, not the center or any wacky offset

-- version 1.0.0

local enabled = false -- cutscene

local debug_mode = false --[[ 
    i would like to point out the fact that the debug mode was the last thing i added to this script. I never used it when making the script itself
    i put it in because first of all, debug mode cool
    and second of all, i wanted to allow people to see whats going on behind the scenes of the script- visually that is.
]]
local camMoves = { -- offsets for each animation
    --['animation name']= {x,  y},
    ['idle']          = { 0, 0 }, -- idle also acts as the default camera position
    ['singLEFT']      = { -20, 0 },
    ['singLEFT-alt']  = { -20, 0 },
    ['singLEFTmiss']  = { -10, 0 },
    ['singUP']        = { 0, -10 },
    ['singUP-alt']    = { 0, -10 },
    ['singUPmiss']    = { 0, -2.5 },
    ['singRIGHT']     = { 20, 0 },
    ['singRIGHT-alt'] = { 20, 0 },
    ['singRIGHTmiss'] = { 10, 0 },
    ['singDOWN']      = { 0, 10 },
    ['singDOWN-alt']  = { 0, 10 },
    ['singDOWNmiss']  = { 0, 2.5 }
}

local cameras = { -- use triggerEvent('','camera',[dad,gf,bf]) to toggle each ones camera movement
    ['boyfriend'] = true,
    ['dad']       = true,
    ['gf']        = true,
}

-- you can disregard everything below because theres nothing you gotta touch below :)

local function midpoint(character)
    local x = getProperty(character .. ".x") + (getProperty(character .. ".width") * 0.5)
    local y = getProperty(character .. ".y") + (getProperty(character .. ".height") * 0.5)

    if character == 'boyfriend' then
        x = x - 100
        y = y - 100
    else
        x = x + 150
        y = y - 100
    end
    local retur = { x, y }
    return retur
end

local function altCharacterNames(character) -- just in case someone wants to trigger the cameras using an alt name
    character = string.lower(character)
    if character == 'bf' or character == 'player' then
        character = 'boyfriend'
    end
    if character == 'opponent' or character == 'opp' then
        character = 'dad'
    end
    if character == 'girlfriend' or character == 'woman' then
        character = 'gf'
    end
    return character
end

local function getOffsets(character)
    character = altCharacterNames(character)
    local offsets = { midpoint(character)[1] + getProperty(character .. '.cameraPosition[0]'),
        midpoint(character)[2] + getProperty(character .. '.cameraPosition[1]') }
    if character == 'boyfriend' then -- because its reversed for bf
        offsets = { midpoint(character)[1] - getProperty(character .. '.cameraPosition[0]'),
            midpoint(character)[2] + getProperty(character .. '.cameraPosition[1]') }
    end
    return offsets
end

local function doDebugStuffs()

end

local function moveCamera(character, pose) -- this is essentially what handles the entire thing

    character = altCharacterNames(character)
    local characterOffsets = getOffsets(character)

    if not camMoves[pose] then
        pose = 'idle'
    end

    local offset = { characterOffsets[1], characterOffsets[2] }
    if cameras[character] then
        offset[1] = offset[1] + camMoves[pose][1]
        offset[2] = offset[2] + camMoves[pose][2]
    end

    triggerEvent('Camera Follow Pos', offset[1], offset[2])

    if debug_mode then
        setProperty('cameraPositionOffset.x',offset[1] - 10)
        setProperty('cameraPositionOffset.y',offset[2] - 10)

        setProperty('cameraPositionCurrent.x',getProperty('camFollowPos.x')- 5)
        setProperty('cameraPositionCurrent.y',getProperty('camFollowPos.y')- 5)

        setProperty('cameraPositionMarker.x',characterOffsets[1] - 10)
        setProperty('cameraPositionMarker.y',characterOffsets[2]- 10)
    end
end

-- this function used to be hella fucking messy but its seperated into functions and it's also far more efficient!!! woo!!
function onUpdate(elapsed)
    -- ITS SO FUCKING SMALL NOW WHAT!!!
    -- Context: the first few iterations of this script had like 50 lines here (and it barely worked too!!)

    if enabled then
    if gfSection then -- handle gfs camera because it's special!!
        moveCamera('gf', getProperty('gf.animation.curAnim.name'))
    else
        if mustHitSection then
            moveCamera('boyfriend', getProperty('boyfriend.animation.curAnim.name'))
        else
            moveCamera('dad', getProperty('dad.animation.curAnim.name'))
        end
    end
end
    if inGameOver then
        close() -- don't want this fucking up the camera
    end
end

function onEvent(name, value1, value2)
    if name == '' then
        if value1 == 'camera' then
            if value2 == 'dad' or value2 == 'boyfriend' or value2 == 'gf' then
                cameras[value2] = not cameras[value2]
            end
        end
    end
end

function onSongStart()
    enabled = true
end

function onCreatePost()
    if debug_mode then
        luaDebugMode = true
        makeLuaSprite('cameraPositionMarker','',0,0)
        makeGraphic('cameraPositionMarker',20,20,'2659ff')
        --setBlendMode('cameraPositionMarker','subtract')

        makeLuaSprite('cameraPositionCurrent','',0,0)
        makeGraphic('cameraPositionCurrent',10,10,'ee0dff')

        makeLuaSprite('cameraPositionOffset','',0,0)
        makeGraphic('cameraPositionOffset',20,20,'ff0000')
       --setBlendMode('cameraPositionOffset','invert')

        addLuaSprite('cameraPositionMarker',true)
        addLuaSprite('cameraPositionCurrent',true)
        addLuaSprite('cameraPositionOffset',true)
    end
end

-- SCRIPT BY AFLAC --
-- if you encounter a bug when making it please let me know in my discord server (https://discord.gg/aflac) or on discord directly, (@aflac#0001) --
-- ty --
