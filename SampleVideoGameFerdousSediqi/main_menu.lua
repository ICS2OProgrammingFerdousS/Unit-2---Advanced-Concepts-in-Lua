--Ferdous Sediqi
--title:Simple videogame
--in this assignment we cred credits screen
local composer = require( "composer" )

-----------------------------------------------------------------------------------------

-- Use Widget Library
local widget = require( "widget" )

-----------------------------------------------------------------------------------------

-- Naming Scene
mainMenu = "main_menu"

-----------------------------------------------------------------------------------------

-- Creating Scene Object
local scene = composer.newScene( mainMenu )


-----------------------------------------------------------------------------------------
-- LOCAL VARIABLES
-----------------------------------------------------------------------------------------

local bkg_image
local playButton
local creditsButton
local instructionsButton
-- backgroundSound
local sound = audio.loadSound("Sounds/TABL.wav")
local soundChannel
local clickSound = audio.loadSound("Sounds/PopSound.wp3.wav")

-----------------------------------------------------------------------------------------
-- LOCAL FUNCTIONS
-----------------------------------------------------------------------------------------

-- Creating Transition Function to Credits Page
local function CreditsTransition( )       
    composer.gotoScene( "credits_screen", {effect = "fromRight", time = 500})

end 

-----------------------------------------------------------------------------------------

-- Creating Transition to Level1 Screen
local function Level1ScreenTransition( )
    composer.gotoScene( "level1_screen", {effect = "fromLeft", time = 1000})

end   

-----------------------------------------------------------------------------------------

-- INSERT LOCAL FUNCTION DEFINITION THAT GOES TO INSTRUCTIONS SCREEN 
local function gotoInstructions( )
    composer.gotoScene("Instruction", {effect = "zoomOutInRotate", time = 500})

end

--timer.performWithDelay ( 3000, gotoInstructions )
-----------------------------------------------------------------------------------------
-- GLOBAL SCENE FUNCTIONS
-----------------------------------------------------------------------------------------

-- The function called when the screen doesn't exist
function scene:create( event )

    -- Creating a group that associates objects with the scene
    local sceneGroup = self.view

    -----------------------------------------------------------------------------------------
    -- BACKGROUND IMAGE & STATIC OBJECTS
    -----------------------------------------------------------------------------------------

    -- Insert the background image and set it to the center of the screen
    bkg_image = display.newImage("Images/main_menu.png")
    bkg_image.x = display.contentCenterX
    bkg_image.y = display.contentCenterY
    bkg_image.width = display.contentWidth
    bkg_image.height = display.contentHeight


    -- Associating display objects with this scene 
    sceneGroup:insert( bkg_image )

    -- Send the background image to the back layer so all other objects can be on top
    bkg_image:toBack()

    -----------------------------------------------------------------------------------------
    -- BUTTON WIDGETS
    -----------------------------------------------------------------------------------------   

    -- Creating Play Button
    playButton = widget.newButton( 
        {   
            -- Set its position on the screen relative to the screen size
            x = display.contentWidth*4/8,
            y = display.contentHeight*9/10,

            -- Setting Dimensions
            width = 150,
            height = 70,

            -- Insert the images here
            defaultFile = "Images/Start Button Unpressed.png", 150, 100,
            overFile = "Images/Start Button Pressed.png", 150, 100,
            --
            -- When the button is released, call the Level1 screen transition function
            onRelease = Level1ScreenTransition    

        } )
    -----------------------------------------------------------------------------------------

    -- Creating Credits Button
    creditsButton = widget.newButton( 
        {
            -- Set its position on the screen relative to the screen size
            x = display.contentWidth*7/8,
            y = display.contentHeight*9/10,

            -- Setting Dimensions
            width = 150,
            height = 70,

            -- Insert the images here
            defaultFile = "Images/Credits Button Unpressed.png", 150, 100,
            overFile = "Images/Credits Button Pressed.png", 150, 100,

            -- When the button is released, call the Credits transition function
            onRelease = CreditsTransition
        } ) 

    -----------------------------------------------------------------------------------------

    -- ADD INSTRUCTIONS BUTTON WIDGET
    instructionsButton = widget.newButton( 
        {
            -- Set its position on the screen relative to the screen size
            x = display.contentWidth*1/8,
            y = display.contentHeight*9/10,

            -- Setting Dimensions
            width = 150,
            height = 70,

            -- Insert the images here
            defaultFile = "Images/Instructions Button Unpressed.png", 150, 100,
            overFile = "Images/Instructions Button Pressed.png", 150, 100,

            -- When the button is released, call the Credits transition function
            onRelease = gotoInstructions
        } ) 
   
    -----------------------------------------------------------------------------------------

    -- Associating button widgets with this scene
    sceneGroup:insert( playButton )
    sceneGroup:insert( creditsButton )
    
    -- INSERT INSTRUCTIONS BUTTON INTO SCENE GROUP
    sceneGroup:insert( instructionsButton )

end -- function scene:create( event )   

-----------------------------------------------------------------------------------------

-- The function called when the scene is issued to appear on screen
function scene:show( event )

    -- Creating a group that associates objects with the scene
    local sceneGroup = self.view

    -----------------------------------------------------------------------------------------

    local phase = event.phase

    -----------------------------------------------------------------------------------------

    -- Called when the scene is still off screen (but is about to come on screen).   
    if ( phase == "will" ) then

        -- The function that will go to the main menu 

    -----------------------------------------------------------------------------------------

    -- Called when the scene is now on screen.
    elseif ( phase == "did" ) then
    soundChannel = audio.play(sound, {channel = 1, loops = -1})
    -- Insert code here to make the scene come alive.
    -- Example: start timers, begin animation, play audio, etc.     

    end

end -- function scene:show( event )

-----------------------------------------------------------------------------------------

-- The function called when the scene is issued to leave the screen
function scene:hide( event )

    -- Creating a group that associates objects with the scene
    local sceneGroup = self.view

    -----------------------------------------------------------------------------------------

    local phase = event.phase

    -----------------------------------------------------------------------------------------

    if ( phase == "will" ) then
-- stoping the backgroundSound
        soundChannel = audio.stop()
        -- Called when the scene is on screen (but is about to go off screen).
        -- Insert code here to "pause" the scene.
        -- Example: stop timers, stop animation, stop audio, etc.

    -----------------------------------------------------------------------------------------

    elseif ( phase == "did" ) then
        -- Called immediately after scene goes off screen.
    end

end -- function scene:hide( event )

-----------------------------------------------------------------------------------------

-- The function called when the scene is issued to be destroyed
function scene:destroy( event )

    -- Creating a group that associates objects with the scene
    local sceneGroup = self.view

    -- Called prior to the removal of scene's view ("sceneGroup").
    -- Insert code here to clean up the scene.
    -- Example: remove display objects, save state, etc.

end -- function scene:destroy( event )

-----------------------------------------------------------------------------------------
-- EVENT LISTENERS
-----------------------------------------------------------------------------------------

-- Adding Event Listeners
scene:addEventListener( "create", scene )
scene:addEventListener( "show", scene )
scene:addEventListener( "hide", scene )
scene:addEventListener( "destroy", scene )

-----------------------------------------------------------------------------------------

return scene
