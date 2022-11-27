function formatTime(seconds)
	-- mostly taken from FlxStringUtil.formatTime
	seconds = math.floor(seconds)
	local timestr = math.floor(seconds/60)..":"
	local timestrhelper = seconds % 60
	if(timestrhelper < 10) then
		timestr = timestr.."0"
	end
	timestr = timestr..timestrhelper
	return timestr
end

function onUpdatePost(elapsed)
	local x = getPropertyFromClass('Conductor', 'songPosition') - getPropertyFromClass('ClientPrefs', 'noteOffset')
	setProperty('timeTxt.text', formatTime(x/1000)..' / '..formatTime(getProperty('songLength')/1000))
end
