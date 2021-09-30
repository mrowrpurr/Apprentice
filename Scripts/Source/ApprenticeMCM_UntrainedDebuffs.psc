scriptName ApprenticeMCM_UntrainedDebuffs hidden

function Render(ApprenticeMCM mcm, string page) global
    if page == "Untrained Debuffs"
        mcm.SetCursorFillMode(mcm.TOP_TO_BOTTOM)
        LeftColumn(mcm)
        mcm.SetCursorPosition(1)
        RightColumn(mcm)
    endIf
endFunction

function LeftColumn(ApprenticeMCM mcm) global
    mcm.AddHeaderOption("Switch Between Debuffs and Skill Restrictions")
    mcm.AddToggleOption("Enable Debuffs", false)
    mcm.AddEmptyOption()
    mcm.AddHeaderOption("Archery")
    mcm.AddToggleOption("Enable Camera Shake", true)
    mcm.AddSliderOption("Camera Shake Multiplier", 0.1)
    mcm.AddToggleOption("Enable Missed Shots", true)
    mcm.AddSliderOption("Missed Shots Multipler", 3.0)
    mcm.AddEmptyOption()
    mcm.AddHeaderOption("Melee Weapons")
endFunction

function RightColumn(ApprenticeMCM mcm) global
    mcm.AddHeaderOption("Sneaking")
    mcm.AddToggleOption("Hide Sneak Eye", true)
    mcm.AddToggleOption("Enable Stagger", true)
    mcm.AddSliderOption("Stagger Chance", 20.0)
endFunction
