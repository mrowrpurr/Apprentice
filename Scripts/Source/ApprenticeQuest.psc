Scriptname ApprenticeQuest extends Quest  
{This is the main Apprentice quest script.
This script is initialized as soon as the mod is installed for first time.}

event OnInit()
    RegisterForMenu("Crafting Menu")
endEvent

event OnMenuOpens(string menuName)
    Debug.MessageBox("Open menu: " + menuName)
endEvent