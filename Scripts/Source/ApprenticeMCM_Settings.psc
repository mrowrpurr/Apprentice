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
    mcm.AddTextOption("Once you're done configuring your character", "")
    mcm.AddTextOption("click the following button to lock the MCM", "")
    mcm.oid_LockMenu = mcm.AddTextOption("", "Click here to lock this menu")
    mcm.AddEmptyOption()
    StartingCharacterStats(mcm)

    ; TODO
    ; mcm.ShowMessage()
endFunction

function RightColumn(ApprenticeMCM mcm) global
    mcm.AddHeaderOption("Settings")
    mcm.oid_Settings_TrainFromBooks_Toggle = mcm.AddToggleOption("Allow Training from Books", mcm.Apprentice_Settings_TrainFromBooks.GetValueInt() == 1, mcm.LockableOptionFlag)
    mcm.oid_Settings_RestrictEnchantedItemUsage = mcm.AddToggleOption("Restrict Enchanted Item Usage", mcm.Apprentice_Settings_RestrictEnchantedItemUsage.GetValueInt() == 1, mcm.LockableOptionFlag)
endFunction

float function GetAV(string skillName) global
    return Game.GetPlayer().GetActorValue(skillName)
endFunction

function SetAV(string skillName, float value) global
    Game.GetPlayer().SetActorValue(skillName, value)
endFunction

function StartingCharacterStats(ApprenticeMCM mcm) global
    mcm.oid_StartingCharacter_PerkPoints_Slider = mcm.AddSliderOption("Starting Perk Points", Game.GetPerkPoints(), a_flags = mcm.LockableOptionFlag)
    mcm.oid_StartingCharacter_Level_Slider = mcm.AddSliderOption("Starting Level", Game.GetPlayer().GetLevel(), a_flags = mcm.LockableOptionFlag)
    mcm.oid_StartingCharacter_Magicka_Slider = mcm.AddSliderOption("Starting Magicka", GetAV("Magicka"), a_flags = mcm.LockableOptionFlag)
    mcm.oid_StartingCharacter_Health_Slider = mcm.AddSliderOption("Starting Health", GetAV("Health"), a_flags = mcm.LockableOptionFlag)
    mcm.oid_StartingCharacter_Stamina_Slider = mcm.AddSliderOption("Starting Stamina", GetAV("Stamina"), a_flags = mcm.LockableOptionFlag)
    mcm.oid_StartingCharacter_CarryWeight_Slider = mcm.AddSliderOption("Carry Weight", GetAV("CarryWeight"), a_flags = mcm.LockableOptionFlag)
endFunction

function OnOptionSelect(ApprenticeMCM mcm, int optionId) global
    if optionId == mcm.oid_LockMenu
        mcm.LockableOptionFlag = mcm.OPTION_FLAG_DISABLED
        mcm.ForcePageReset()
        return
    endIf

    ; Enchanted Item Restriction
    if optionId == mcm.oid_Settings_RestrictEnchantedItemUsage
        if mcm.Apprentice_Settings_RestrictEnchantedItemUsage.GetValueInt() == 1
            mcm.Apprentice_Settings_RestrictEnchantedItemUsage.SetValueInt(0)
            mcm.SetToggleOptionValue(mcm.oid_Settings_RestrictEnchantedItemUsage, false)
        else
            mcm.Apprentice_Settings_RestrictEnchantedItemUsage.SetValueInt(1)
            mcm.SetToggleOptionValue(mcm.oid_Settings_RestrictEnchantedItemUsage, true)
        endIf

    ; Training from Books
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

function SetSliderValuesForAV(ApprenticeMCM mcm, string actorValueName, float startingValue = 1.0, float endingValue = 1000.0, float interval = 1.0) global
    float skillValue = GetAV(actorValueName)
    mcm.SetSliderDialogDefaultValue(skillValue)
    mcm.SetSliderDialogStartValue(skillValue)
    mcm.SetSliderDialogRange(startingValue, endingValue)
    mcm.SetSliderDialogInterval(interval)
endFunction

function OnOptionSliderOpen(ApprenticeMCM mcm, int optionId) global
    if optionId == mcm.oid_StartingCharacter_Magicka_Slider
        SetSliderValuesForAV(mcm, "Magicka")
    elseIf optionId == mcm.oid_StartingCharacter_Health_Slider
        SetSliderValuesForAV(mcm, "Health")
    elseIf optionId == mcm.oid_StartingCharacter_Stamina_Slider
        SetSliderValuesForAV(mcm, "Stamina")
    elseIf optionId == mcm.oid_StartingCharacter_CarryWeight_Slider
        SetSliderValuesForAV(mcm, "CarryWeight")
    elseIf optionId == mcm.oid_StartingCharacter_PerkPoints_Slider
        int perkPoints = Game.GetPerkPoints()
        mcm.SetSliderDialogDefaultValue(perkPoints)
        mcm.SetSliderDialogStartValue(perkPoints)
        mcm.SetSliderDialogRange(0, 100)
        mcm.SetSliderDialogInterval(1.0)
    elseIf optionId == mcm.oid_StartingCharacter_Level_Slider
        int level = Game.GetPlayer().GetLevel()
        mcm.SetSliderDialogDefaultValue(level)
        mcm.SetSliderDialogStartValue(level)
        mcm.SetSliderDialogRange(0, 100)
        mcm.SetSliderDialogInterval(1.0)
    endIf
endFunction

function OnOptionSliderAccept(ApprenticeMCM mcm, int optionId, float value) global
    if optionId == mcm.oid_StartingCharacter_Magicka_Slider
        SetAV("Magicka", value)
        mcm.SetSliderOptionValue(mcm.oid_StartingCharacter_Magicka_Slider, value)
    elseIf optionId == mcm.oid_StartingCharacter_Health_Slider
        SetAV("Health", value)
        mcm.SetSliderOptionValue(mcm.oid_StartingCharacter_Health_Slider, value)
    elseIf optionId == mcm.oid_StartingCharacter_Stamina_Slider
        SetAV("Stamina", value)
        mcm.SetSliderOptionValue(mcm.oid_StartingCharacter_Stamina_Slider, value)
    elseIf optionId == mcm.oid_StartingCharacter_CarryWeight_Slider
        SetAV("CarryWeight", value)
        mcm.SetSliderOptionValue(mcm.oid_StartingCharacter_CarryWeight_Slider, value)
    elseIf optionId == mcm.oid_StartingCharacter_PerkPoints_Slider
        Game.SetPerkPoints(value as int)
        mcm.SetSliderOptionValue(mcm.oid_StartingCharacter_PerkPoints_Slider, value) 
    elseIf optionId == mcm.oid_StartingCharacter_Level_Slider
        Game.SetPlayerLevel(value as int)
        mcm.SetSliderOptionValue(mcm.oid_StartingCharacter_Level_Slider, value)
    endIf
endFunction
