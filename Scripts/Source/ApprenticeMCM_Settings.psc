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
    mcm.oid_LockMenu = mcm.AddTextOption("", "Click here to lock this menu")

    mcm.AddHeaderOption("Settings")
    mcm.oid_Settings_TrainFromBooks_Toggle = mcm.AddToggleOption("Training from Books", mcm.Apprentice_Settings_TrainFromBooks.GetValueInt() == 1)
    mcm.oid_Settings_RestrictEnchantedItemUsage = mcm.AddToggleOption("Restrict Enchanted Item Usage", mcm.Apprentice_Settings_RestrictEnchantedItemUsage.GetValueInt() == 1, mcm.LockableOptionFlag)
endFunction

function RightColumn(ApprenticeMCM mcm) global
    mcm.AddHeaderOption("Enable/Disable Mod")
    mcm.AddToggleOption("Mod Enabled", true)
endFunction

function OnOptionSelect(ApprenticeMCM mcm, int optionId) global
    if optionId == mcm.oid_LockMenu
        mcm.LockableOptionFlag = mcm.OPTION_FLAG_DISABLED
        mcm.ForcePageReset()
        return
    endIf

    ; Magic Enchanting
    if optionId == mcm.oid_TrainedSkills_Magic_Enchanting_Toggle
        if mcm.Apprentice_Training_Enchanting.GetValueInt() == 1
            mcm.Apprentice_Training_Enchanting.SetValueInt(0)
            mcm.SetToggleOptionValue(mcm.oid_TrainedSkills_Magic_Enchanting_Toggle, false)
        else
            mcm.Apprentice_Training_Enchanting.SetValueInt(1)
            mcm.SetToggleOptionValue(mcm.oid_TrainedSkills_Magic_Enchanting_Toggle, true)
        endIf
    ; Book
    elseIf optionId == mcm.oid_Settings_TrainFromBooks_Toggle
        if mcm.Apprentice_Settings_TrainFromBooks.GetValueInt() == 1
            mcm.Apprentice_Settings_TrainFromBooks.SetValueInt(0)
            mcm.SetToggleOptionValue(mcm.oid_Settings_TrainFromBooks_Toggle, false)
        else
            mcm.Apprentice_Settings_TrainFromBooks.SetValueInt(1)
            mcm.SetToggleOptionValue(mcm.oid_Settings_TrainFromBooks_Toggle, true)
        endIf
    endIf
endFunction

function OnOptionHighlight(ApprenticeMCM mcm, int optionId) global
    ; Settings
    if optionId == mcm.oid_Settings_RestrictEnchantedItemUsage
        mcm.SetInfoText("Toggle Restriction of Enchanted Item Usage (when enabled, you must be trained in the magic skill(s) of the associated item enchantment)")
    ; Book
    elseIf optionId == mcm.oid_Settings_TrainFromBooks_Toggle
        mcm.SetInfoText("Toggle whether skill increases from skill books count as training")
    endIf
endFunction

