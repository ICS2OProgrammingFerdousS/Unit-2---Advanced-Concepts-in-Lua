-- main.lua
--Ferdous
-- mute and unMute

display.setDefault("background", 1, 1, 1)

local composer = require( "composer" )
-----------------------------------------------------------------------------------------

-- Use Widget Library
local widget = require( "widget" )
-----------------------------------------------------------------------------------------
-- Naming Scene
sceneName = "main_Menu"

-- Creating Scene Object
local scene = composer.newScene( sceneName )

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
	audio.resume(backgroundMusic)
	muteButton.isVisible = true
	unmuteButton.isVisible = false
	soundOn = true


	end
end

------------------------------------------------------------------------------------
--global functions
------------------------------------------------------------------------------------
function scene:create( event )
	local sceneGroup = self.view
	--creating mute button
	muteButton = display.newImageRect("Images/speeker.png", 80, 80)
	muteButton.x = display.contentWidth*4.5/10
	muteButton.y = display.contentHeight*4.5/10
	muteButton.isVisible = true
--creating mut button
	unmuteButton = display.newImageRect("Images/secondSpeeker.png", 80, 80)
	unmuteButton.x = display.contentWidth*4.5/10
	unmuteButton.y = display.contentHeight*4.5/10
	unmuteButton.isVisible = false
	sceneGroup:insert(muteButton)
	sceneGroup:insert(unmuteButton)

end
function scene:show( event )
	local sceneGroup = self.view
	local phase = event.phase
	----------------------------------------------------------------------------------
--global veriables
----------------------------------------------------------------------------------
	soundOn = true
	if(phase == "will")then

	elseif(phase == "did")then
	backgroundMusicChannel = audio.play(backgroundMusic, {loops = -1})
	muteButton:addEventListener("touch", Mute)
	unmuteButton:addEventListener("touch", unMute )

    end
   end

function scene:hide( event )
	local sceneGroup = self.view
	local phase = event.phase
	if(phase == "will")then
	audio.pause(backgroundMusic)
	elseif(phase == "did")then
	muteButton:removeEventListener("touch", Mute)
	unmuteButton:removeEventListener("touch", unMute )

    end
end
function scene:destroy( event )

    -- Creating a group that associates objects with the scene
 	local sceneGroup = self.view

end
scene:addEventListener( "create", scene )
scene:addEventListener( "show", scene )
scene:addEventListener( "hide", scene )
scene:addEventListener( "destroy", scene )

-----------------------------------------------------------------------------------------

return scene