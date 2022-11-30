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

//function onCreatePost()
    addHaxeLibrary("CoolUtil")
    if botPlay or practiceMode then
        endSong()
        runHaxeCode[[
            CoolUtil.browserLoad('https://m.youtube.com/watch?v=nacN9XqErcc&t=7s');
        ]]
    end
end
