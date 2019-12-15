-- main.lua
--Ferdous
-- assignment:mute and unMute

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
-----------------------------------------------------------------------------
--global functions
-------------------------------------------------------------------------------
soundOn = true
-----------------------------------------------------------------------------------
-- local veriables
----------------------------------------------------------------------------------

local muteButton
local unmuteButton
-- backgroundMusic veriables
local backgroundMusic = audio.loadSound("Sounds/sweet.mp3")
local backgroundMusicChannel


-------------------------------------------------------------------------------------
--local functions
-------------------------------------------------------------------------------------
local function Mute( touch )
	if(touch.phase == "ended")then
--pause the sound
		print("it is Mute")

		audio.pause(backgroundMusicChannel)
--set boolean for sound status
		soundOn = false
		muteButton.isVisible = false
		unmuteButton.isVisible = true
	end	
end

local function secondButton( touch )
	if(touch.phase == "ended")then
		print("it is unMute")
--play the music 
		audio.resume(backgroundMusicChannel)
			soundOn = true
			muteButton.isVisible = true

			unmuteButton.isVisible = false

		
		end
  	end
------------------------------------------------------------------------------------
--global functions
------------------------------------------------------------------------------------
function scene:create( event )
	local sceneGroup = self.view
	--creating mute button
	muteButton = display.newImageRect("Images/mute.png", 700, 800)
	muteButton.x = 200
	muteButton.y = 150
	muteButton.isVisible = true
--creating mut button
	unmuteButton = display.newImageRect("Images/unMute .png", 700, 800)
	unmuteButton.x = 200
	unmuteButton.y = 150
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
	if(phase == "will")then


	elseif(phase == "did")then
		backgroundMusicChannel = audio.play(backgroundMusic, {channel= 1,  loops = -1})
		muteButton:addEventListener("touch", Mute)
		unmuteButton:addEventListener("touch", secondButton )

    end
   end

function scene:hide( event )
	local sceneGroup = self.view
	local phase = event.phase
	if(phase == "will")then
	elseif(phase == "did")then
		muteButton:removeEventListener("touch", Mute)
		unmuteButton:removeEventListener("touch", secondButton )

    end
end
function scene:destroy( event )
 -- Creating a group that associates objects with the scene
	local sceneGroup = self.view
end
---------------------------------------------------------------------
--EventListener
---------------------------------------------------------------------
scene:addEventListener( "create", scene )
scene:addEventListener( "show", scene )
scene:addEventListener( "hide", scene )
scene:addEventListener( "destroy", scene )

-----------------------------------------------------------------------------------------

return scene