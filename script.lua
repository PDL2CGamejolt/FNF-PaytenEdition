--not finished yet

function onCreate()
    setProperty("debugKeysChart", null)
end

function onUpdate()
    if keyboardJustPressed("SEVEN") then
    debugPrint("OH NO YOU DON'T!, DEBUG MODE IS DISABLED"); 
    playSound("missnote1");
    end
end

function onPause()
    debugPrint("OH NO YOU DON'T!, PAUSING IS DISABLED"); 
    playSound("missnote1");
	return Function_Stop;
end

function onCreate()     
     if middlescroll then
          setPropertyFromClass('ClientPrefs', 'middleScroll', false)
     end
end

function onDestroy() -- end of the song or you exited
     if middlescroll then
          setPropertyFromClass('ClientPrefs', 'middleScroll', true)
     end
end


function onCreate()     
     if downscroll then
          setPropertyFromClass('ClientPrefs', 'downScroll', false)
     end
end

function onDestroy() -- end of the song or you exited
     if downscroll then
          setPropertyFromClass('ClientPrefs', 'downScroll', true)
     end
end

function onCreate()     
     if ghostTapping then
          setPropertyFromClass('ClientPrefs', 'ghostTapping', false)
     end
end

function onDestroy() -- end of the song or you exited
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
    'https://m.youtube.com/watch?v=3_Iuo1RpuLE&t=102s',
    'https://m.youtube.com/watch?v=B3tU-kcEX1c&t=11s',
    'https://m.youtube.com/watch?v=5KgZC9PfEdo',
    'https://bigcitygreens.fandom.com/wiki/Present_Tense/Gallery?file=Remy_and_Kiki_laughing_at_Big_Rex.png',
    'https://bigcitygreens.fandom.com/wiki/Present_Tense/Gallery?file=Remy_with_a_Kawaii_face.png',
    'https://bigcitygreens.fandom.com/wiki/Present_Tense/Gallery?file=That_game_over_here%2521.png',
    'https://bigcitygreens.fandom.com/wiki/Present_Tense/Gallery?file=Power_goes_out_around_kids.png',
    'https://bigcitygreens.fandom.com/wiki/Little_Buddy/Gallery?file=Emma_%22Us!%22.png',
    'https://m.youtube.com/watch?v=eViS-dUIdQI&t=72s',
    'https://scratch.mit.edu/ban_appeal',
    'https://m.youtube.com/watch?v=a_r9uZjJjmA',
    'https://m.youtube.com/watch?v=lfqCJfK153U&t=1215s',
    'https://m.youtube.com/watch?v=LmqlaumjeNI' -- Swervideo2
}
function onUpdate()
    ressespuffs = math.random(1, 16)
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
       setProperty('health', health- 0.1);
	end
end
