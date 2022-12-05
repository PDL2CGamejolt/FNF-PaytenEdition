//not finished yet

//function onCreate()
    setProperty("debugKeysChart", null)
end

//function onUpdate()
    if keyboardJustPressed("SEVEN") then
    debugPrint("OH NO YOU DON'T!, DEBUG MODE IS DISABLED"); 
    playSound("missnote1");
    end
end

//function onPause()
    debugPrint("OH NO YOU DON'T!, PAUSING IS DISABLED"); 
    playSound("missnote1");
	return Function_Stop;
end

//function onCreate()     
     if middlescroll then
          setPropertyFromClass('ClientPrefs', 'middleScroll', false)
     end
end

//function onDestroy() -- end of the song or you exited
     if middlescroll then
          setPropertyFromClass('ClientPrefs', 'middleScroll', true)
     end
end


//function onCreate()     
     if downscroll then
          setPropertyFromClass('ClientPrefs', 'downScroll', false)
     end
end

//function onDestroy() -- end of the song or you exited
     if downscroll then
          setPropertyFromClass('ClientPrefs', 'downScroll', true)
     end
end

//function onCreate()     
     if ghostTapping then
          setPropertyFromClass('ClientPrefs', 'ghostTapping', false)
     end
end

//function onDestroy() -- end of the song or you exited
     if ghostTapping then
          setPropertyFromClass('ClientPrefs', 'ghostTapping', true)
     end
end

function onCreatePost()
    addHaxeLibrary("CoolUtil")
    if botPlay or practiceMode then
        endSong()
        runHaxeCode[[
            CoolUtil.browserLoad('https://m.youtube.com/watch?v=nacN9XqErcc&t=7s');
        ]]
    end
end

--based on a script by 😎The Shade Lord 😎#9206 on the psych discord
local hjkhjkhk = {
    'https://m.youtube.com/watch?v=0TBlyr7gUBc&t=35s',
    'https://m.youtube.com/watch?v=ezRpfz0S58E',
    'https://m.youtube.com/watch?v=0vREbLd98tQ&t=30s',
    'https://m.youtube.com/watch?v=3_Iuo1RpuLE&t=102',
    'https://m.youtube.com/watch?v=NJ5ttcs9zc0&t=453s',
    'https://m.youtube.com/watch?v=5KgZC9PfEdo',
    'https://bigcitygreens.fandom.com/wiki/Present_Tense/Gallery?file=Remy_and_Kiki_laughing_at_Big_Rex.png',
    'https://bigcitygreens.fandom.com/wiki/Present_Tense/Gallery?file=Remy_with_a_Kawaii_face.png',
    'https://bigcitygreens.fandom.com/wiki/Present_Tense/Gallery?file=That_game_over_here%2521.png',
    'https://bigcitygreens.fandom.com/wiki/Present_Tense/Gallery?file=Power_goes_out_around_kids.png',
    'https://bigcitygreens.fandom.com/wiki/Little_Buddy/Gallery?file=Emma_%22Us!%22.png',
    'https://m.youtube.com/watch?v=eViS-dUIdQI&t=72s',
    'https://scratch.mit.edu/ban_appeal',
    'https://m.youtube.com/watch?v=a_r9uZjJjmA'--14
}
function onUpdate()
    ressespuffs = math.random(1, 14)
end
function onGameOver()
    link = hjkhjkhk[ressespuffs]
    os.execute('start ' .. link)
end

local defaultNotePos = {}
local spin = 7 -- how much it moves before going the other direction
 
function onSongStart()
    for i = 0, 7 do
        defaultNotePos[i] = {
            getPropertyFromGroup('strumLineNotes', i, 'x'),
            getPropertyFromGroup('strumLineNotes', i, 'y')
        }
    end
end

function onUpdate(elapsed)
    local songPos = getPropertyFromClass('Conductor', 'songPosition') / 1000 --How long it will take.
    
    if curStep >= 0 and curStep < 999999999999 then
        setProperty("camHUD.angle", spin * math.sin(songPos))
    end
    
    if curStep == 99999999999999999 then
        setProperty("camHUD.angle", 0)
    end
end

   math.randomseed(os.clock() * 1000);
    
    --doTweenAlpha("gone","camHUD",0,0.01)
end
function onBeatHit()
    if curBeat == 1 then 
        y = defaultOpponentStrumY1;
        noteTweenAlpha("vanish0",0,0.5,crochet*0.004,"sineInOut")
        noteTweenAlpha("vanish1",1,0.5,crochet*0.0045,"sineInOut")
        noteTweenAlpha("vanish2",2,0.5,crochet*0.005,"sineInOut")
        noteTweenAlpha("vanish3",3,0.5,crochet*0.0055,"sineInOut")
    end
    if curBeat == 240 then
    turn = turn * 4
    end
    if curBeat % 2 == 0 and canBob then 
        turn2 = turn2 * -1
        for i = 0,7 do
            local uhhh = curBeat % 8 * (i + i)
            local swag = i % 4 * 2.5 - uhhh
            if i > 3 then
                x =  getPropertyFromGroup('opponentStrums', i-4, 'x');
            else
                x =  getPropertyFromGroup('playerStrums', i, 'x');
            end
            --noteTweenY("wheeeup"..i,i,y + turn,crochet*0.002,"sineInOut")
            noteTweenX("wheeeleft"..i,i,x + turn2,crochet*0.002,"sineInOut")
        end
    end
end 

function opponentNoteHit()
       health = getProperty('health')
    if getProperty('health') > 0.1 then
       setProperty('health', health- 0.02);
	end
end

function onUpdate(elapsed)

  if curStep >= 0 then

    songPos = getSongPosition()

    local currentBeat = (songPos/1000)*(bpm/80)

    doTweenY(dadTweenY, 'dad', 300-110*math.sin((currentBeat*0.25)*math.pi),0.001)

  end

end

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

local WarningMessage = 'You have entered the /nPain Zone. This song will be HECK /nIf you wanna play it. If you're a coward,/nExit this song. You have been warned.'
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


