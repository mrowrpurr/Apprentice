scriptName ApprenticeMCM_TrainedSkills hidden

function Render(ApprenticeMCM mcm, string page) global
    if page == "Trained Skills"
        mcm.SetCursorFillMode(mcm.TOP_TO_BOTTOM)
        LeftColumn(mcm)
        mcm.SetCursorPosition(1)
        RightColumn(mcm)
    endIf
endFunction

function LeftColumn(ApprenticeMCM mcm) global
    Armor(mcm)
    Weapons(mcm)
endFunction

function RightColumn(ApprenticeMCM mcm) global
    Magic(mcm)
    MagicSkills(mcm)
endFunction

function Magic(ApprenticeMCM mcm) global
    mcm.AddHeaderOption("Magic Skills")
    mcm.oid_TrainedSkills_Magic_Alchemy_Toggle = mcm.AddToggleOption("Alchemy", mcm.Apprentice_Training_Alchemy.GetValueInt() == 1)
    mcm.oid_TrainedSkills_Magic_Enchanting_Toggle = mcm.AddToggleOption("Enchanting", mcm.Apprentice_Training_Enchanting.GetValueInt() == 1)
endFunction

function MagicSkills(ApprenticeMCM mcm) global
    mcm.AddHeaderOption("Magic")
    mcm.AddToggleOption("Destruction", mcm.Apprentice_Training_Destruction.GetValueInt() == 1)
    mcm.AddToggleOption("Restoration", mcm.Apprentice_Training_Restoration.GetValueInt() == 1)
endFunction

function Armor(ApprenticeMCM mcm) global
    mcm.AddHeaderOption("Armor")
    mcm.AddToggleOption("Light Armor", mcm.Apprentice_Training_LightArmor.GetValueInt() == 1)
    mcm.AddToggleOption("Heavy Armor", mcm.Apprentice_Training_HeavyArmor.GetValueInt() == 1)
endFunction

function Weapons(ApprenticeMCM mcm) global
    mcm.AddHeaderOption("Weapons")
    mcm.AddToggleOption("One Handed", mcm.Apprentice_Training_OneHanded.GetValueInt() == 1)
    mcm.AddToggleOption("Two Handed", mcm.Apprentice_Training_TwoHanded.GetValueInt() == 1)
    mcm.oid_TrainedSkills_Weapons_Marksman_Toggle = mcm.AddToggleOption("Archery", mcm.Apprentice_Training_Marksman.GetValueInt() == 1)
endFunction

function OnOptionSelect(ApprenticeMCM mcm, int optionId) global
    if optionId == mcm.oid_TrainedSkills_Weapons_Marksman_Toggle
        if mcm.Apprentice_Training_Marksman.GetValueInt() == 1
            mcm.Apprentice_Training_Marksman.SetValueInt(0)
            mcm.SetToggleOptionValue(mcm.oid_TrainedSkills_Weapons_Marksman_Toggle, false)
        else
            mcm.Apprentice_Training_Marksman.SetValueInt(1)
            mcm.SetToggleOptionValue(mcm.oid_TrainedSkills_Weapons_Marksman_Toggle, true)
        endIf
    elseIf optionId == mcm.oid_TrainedSkills_Magic_Alchemy_Toggle
        if mcm.Apprentice_Training_Alchemy.GetValueInt() == 1
            mcm.Apprentice_Training_Alchemy.SetValueInt(0)
            mcm.SetToggleOptionValue(mcm.oid_TrainedSkills_Magic_Alchemy_Toggle, false)
        else
            mcm.Apprentice_Training_Alchemy.SetValueInt(1)
            mcm.SetToggleOptionValue(mcm.oid_TrainedSkills_Magic_Alchemy_Toggle, true)
        endIf
    elseIf optionId == mcm.oid_TrainedSkills_Magic_Enchanting_Toggle
        if mcm.Apprentice_Training_Enchanting.GetValueInt() == 1
            mcm.Apprentice_Training_Enchanting.SetValueInt(0)
            mcm.SetToggleOptionValue(mcm.oid_TrainedSkills_Magic_Enchanting_Toggle, false)
        else
            mcm.Apprentice_Training_Enchanting.SetValueInt(1)
            mcm.SetToggleOptionValue(mcm.oid_TrainedSkills_Magic_Enchanting_Toggle, true)
        endIf
    else
        Debug.MessageBox("You, we dunno anything about option " + optionId + " yet!")
    endIf
endFunction
