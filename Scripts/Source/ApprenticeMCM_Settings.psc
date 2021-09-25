scriptName ApprenticeMCM_Settings hidden

function Render(ApprenticeMCM mcm, string page) global
    if page == "Settings"
        mcm.SetCursorFillMode(mcm.TOP_TO_BOTTOM)
        LeftColumn(mcm)
        mcm.SetCursorPosition(1)
        RightColumn(mcm)
    endIf
endFunction

function LeftColumn(ApprenticeMCM mcm) global
    mcm.AddHeaderOption("Settings")
    mcm.oid_Settings_RestrictEnchantedItemUsage = mcm.AddToggleOption("Restrict Enchanted Item Usage", mcm.Apprentice_Settings_RestrictEnchantedItemUsage.GetValueInt() == 1, mcm.TrainingMenuOptionFlag)
endFunction

function RightColumn(ApprenticeMCM mcm) global
    mcm.AddHeaderOption("Enable/Disable Mod")
    mcm.AddToggleOption("Mod Enabled", true)
endFunction

function OnOptionSelect(ApprenticeMCM mcm, int optionId) global
    if optionId == mcm.oid_TrainedSkills_Magic_Enchanting_Toggle
        if mcm.Apprentice_Training_Enchanting.GetValueInt() == 1
            mcm.Apprentice_Training_Enchanting.SetValueInt(0)
            mcm.SetToggleOptionValue(mcm.oid_TrainedSkills_Magic_Enchanting_Toggle, false)
        else
            mcm.Apprentice_Training_Enchanting.SetValueInt(1)
            mcm.SetToggleOptionValue(mcm.oid_TrainedSkills_Magic_Enchanting_Toggle, true)
        endIf
    endIf
endFunction

function OnOptionHighlight(ApprenticeMCM mcm, int optionId) global
    ; Settings
    if optionId == mcm.oid_Settings_RestrictEnchantedItemUsage
        mcm.SetInfoText("Toggle Restriction of Enchanted Item Usage (when enabled, you must be trained in the magic skill(s) of the associated item enchantment)")
    endIf
endFunction

