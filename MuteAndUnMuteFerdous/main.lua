-----------------------------------------------------------------------------------------
--
-- main.lua
----------------------------------------------------------------------------------
--global veriables
----------------------------------------------------------------------------------
soundOn = true

-----------------------------------------------------------------------------------
-- local veriables
----------------------------------------------------------------------------------
local muteButton
local unmuteButton
-- backgroundMusic veriables
local backgroundMusic = audio.loadSound("Sounds/Hoot.wav")
local backgroundMusicChannel

-------------------------------------------------------------------------------------
--local functions
-------------------------------------------------------------------------------------
local function Mute( touch )
	if(touch.phase == "ended")then
		--pause the sound
	audio.pause(backgroundMusic)
		--set boolean for sound status
	soundOn = false
	muteButton.isVisible = false
	unmuteButton.isVisible = true
	end	
end
local function unMute( touch )
	if(touch.pause == "ended")then
	--play the music 
	audio.play(backgroundMusic)
	soundOn = true
	muteButton.isVisible = true
	unmuteButton.isVisible = false
end
-----------------------------------------------------------------------------------
--object creation
-----------------------------------------------------------------------------------
--creating mute button
muteButton = display.newImageRect("Images/loud.png", 200, 200)
muteButton.x = display.contentWidth*1.5/10
muteButton.y = display.contentHeight*1.3/10
muteButton.isVisible = true
--creating mut button
muteButton = display.newImageRect("Images/icon.jpg", 200, 200)
muteButton.x = display.contentWidth*1.5/10
muteButton.y = display.contentHeight*1.3/10
muteButton.isVisible = false

------------------------------------------------------------------------------------
--global functions
------------------------------------------------------------------------------------
function scene:show( event )
	local sceneGroup = self.view
	local phase = event.phase
	if(phase == "will")then
	elseif(phase == "did")then
	backgroundMusicChannel = audio.play(backgroundMusic, {loops = -1})
	muteButton:addEventListener("touch", mute)
	unmuteButton:addEventListener("touch", unMute )

    end
   end
end
function scene:hide( event )
	local sceneGroup = self.view
	local phase = event.phase
	if(phase == "will")then
	audio.stop(backgroundMusic)
	elseif(phase == "did")then
	muteButton:removeEventListener("touch", mute)
	unmuteButton:removeEventListener("touch", unMute )

    end
end
 


