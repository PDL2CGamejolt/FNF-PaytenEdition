function onCreate()
	--Iterate over all notes
	for i = 0, getProperty('unspawnNotes.length')-1 do
		--Check if the note is a Bullet Note
		if getPropertyFromGroup('unspawnNotes', i, 'noteType') == 'Bullet' then
			setPropertyFromGroup('unspawnNotes', i, 'texture', 'Bullet_Note'); --Change texture
			setPropertyFromGroup('unspawnNotes', i, 'missHealth', 0.5); --Change amount of health to take when you miss like a fucking moron
		end
	end
	--debugPrint('Script started!')
end

function goodNoteHit(id, direction, noteType, isSustainNote)
	if noteType == 'Bullet' then
		if difficulty == 2 then
			playSound('shot', 0.5);
		end
		characterPlayAnim('dad', 'shoot', false);
		characterPlayAnim('boyfriend', 'dodge', true);
		setProperty('boyfriend.specialAnim', true);
		setProperty('dad.specialAnim', true);
		cameraShake('camGame', 0.01, 0.2)
           playSound('shot', 0.5);
    end
end

local healthDrain = 0;
function noteMiss(id, noteData, noteType, isSustainNote)
	if noteType == 'Bullet' then
		characterPlayAnim('boyfriend', 'hurt', true);
		setProperty('boyfriend.specialAnim', true);
		characterPlayAnim('dad', 'shoot', false);
		setProperty('dad.specialAnim', true);
		cameraShake('camGame', 0.01, 0.2)
           playSound('shot', 0.5);
		setProperty('health', getProperty('health') - 0.6);
		cameraShake('camGame', 0.01, 0.2)
           playSound('shot', 0.5);
	end
end