scriptName ApprenticeMCM_SkillLevels hidden

function Render(ApprenticeMCM mcm, string page) global
    if page == "Skill Levels"
        mcm.SetCursorFillMode(mcm.TOP_TO_BOTTOM)
        LeftColumn(mcm)
        mcm.SetCursorPosition(1)
        RightColumn(mcm)
    endIf
endFunction

function LeftColumn(ApprenticeMCM mcm) global
    Armor(mcm)
    Weapons(mcm)
    MoreSkills(mcm)
endFunction

function RightColumn(ApprenticeMCM mcm) global
    mcm.oid_StartingCharacter_ResetSkillsToZero = mcm.AddTextOption("", "Reset all starting skills to zero")
    LockpickingAndPickpocket(mcm)
    Magic(mcm)
    MagicSkills(mcm)
endFunction

float function GetAV(string skillName) global
    return Game.GetPlayer().GetActorValue(skillName)
endFunction

function SetAV(string skillName, float value) global
    Game.GetPlayer().SetActorValue(skillName, value)
endFunction

function Armor(ApprenticeMCM mcm) global
    mcm.AddHeaderOption("Armor")
    mcm.oid_Skills_LightArmor_Slider = mcm.AddSliderOption("Light Armor", GetAV("LightArmor"), a_flags = mcm.LockableOptionFlag)
    mcm.oid_Skills_HeavyArmor_Slider = mcm.AddSliderOption("Heavy Armor", GetAV("LightArmor"), a_flags = mcm.LockableOptionFlag)
endFunction

function Weapons(ApprenticeMCM mcm) global
    mcm.AddHeaderOption("Weapons")
    mcm.oid_Skills_OneHanded_Slider = mcm.AddSliderOption("One-Handed", GetAV("OneHanded"), a_flags = mcm.LockableOptionFlag)
    mcm.oid_Skills_TwoHanded_Slider = mcm.AddSliderOption("Two-Handed", GetAV("TwoHanded"), a_flags = mcm.LockableOptionFlag)
    mcm.oid_Skills_Marksman_Slider = mcm.AddSliderOption("Marksman", GetAV("Marksman"), a_flags = mcm.LockableOptionFlag)
endFunction

function MoreSkills(ApprenticeMCM mcm) global
    mcm.AddHeaderOption("More Skills")
    mcm.oid_Skills_Smithing_Slider = mcm.AddSliderOption("Smithing", GetAV("Smithing"), a_flags = mcm.LockableOptionFlag)
    mcm.oid_Skills_Block_Slider = mcm.AddSliderOption("Block", GetAV("Block"), a_flags = mcm.LockableOptionFlag)
    mcm.oid_Skills_Speechcraft_Slider = mcm.AddSliderOption("Speech", GetAV("Speechcraft"), a_flags = mcm.LockableOptionFlag)
    mcm.oid_Skills_Sneak_Slider = mcm.AddSliderOption("Sneak", GetAV("Sneak"), a_flags = mcm.LockableOptionFlag)
endFunction

function LockpickingAndPickpocket(ApprenticeMCM mcm) global
    mcm.AddHeaderOption("Lockpicking & Pickpocket")
    mcm.oid_Skills_Lockpicking_Slider = mcm.AddSliderOption("Lockpicking", GetAV("Lockpicking"), a_flags = mcm.LockableOptionFlag)
    mcm.oid_Skills_Pickpocket_Slider = mcm.AddSliderOption("Pickpocket", GetAV("Pickpocket"), a_flags = mcm.LockableOptionFlag)
endFunction

function Magic(ApprenticeMCM mcm) global
    mcm.AddHeaderOption("Magic")
    mcm.oid_Skills_Alteration_Slider = mcm.AddSliderOption("Alteration", GetAV("Alteration"), a_flags = mcm.LockableOptionFlag)
    mcm.oid_Skills_Conjuration_Slider = mcm.AddSliderOption("Conjuration", GetAV("Conjuration"), a_flags = mcm.LockableOptionFlag)
    mcm.oid_Skills_Destruction_Slider = mcm.AddSliderOption("Destruction", GetAV("Destruction"), a_flags = mcm.LockableOptionFlag)
    mcm.oid_Skills_Illusion_Slider = mcm.AddSliderOption("Illusion", GetAV("Illusion"), a_flags = mcm.LockableOptionFlag)
    mcm.oid_Skills_Restoration_Slider = mcm.AddSliderOption("Restoration", GetAV("Restoration"), a_flags = mcm.LockableOptionFlag)
endFunction

function MagicSkills(ApprenticeMCM mcm) global
    mcm.oid_Skills_Alchemy_Slider = mcm.AddSliderOption("Alchemy", GetAV("Alchemy"), a_flags = mcm.LockableOptionFlag)
    mcm.oid_Skills_Enchanting_Slider = mcm.AddSliderOption("Enchanting", GetAV("Enchanting"), a_flags = mcm.LockableOptionFlag)
endFunction

function SetSliderValuesForSkill(ApprenticeMCM mcm, string skillName) global
    float skillValue = GetAV(skillName)
    mcm.SetSliderDialogDefaultValue(skillValue)
    mcm.SetSliderDialogStartValue(skillValue)
    mcm.SetSliderDialogRange(0, 100)
    mcm.SetSliderDialogInterval(1)
endFunction

function OnOptionSliderOpen(ApprenticeMCM mcm, int optionId) global
    ; Armor
    if optionId == mcm.oid_Skills_HeavyArmor_Slider
        SetSliderValuesForSkill(mcm, "HeavyArmor")
    elseIf optionId == mcm.oid_Skills_LightArmor_Slider
        SetSliderValuesForSkill(mcm, "LightArmor")
    ; Weapons
    elseIf optionId == mcm.oid_Skills_OneHanded_Slider
        SetSliderValuesForSkill(mcm, "OneHanded")
    elseIf optionId == mcm.oid_Skills_TwoHanded_Slider
        SetSliderValuesForSkill(mcm, "TwoHanded")
    elseIf optionId == mcm.oid_Skills_Marksman_Slider
        SetSliderValuesForSkill(mcm, "Marksman")
    ; Other
    elseIf optionId == mcm.oid_Skills_Smithing_Slider
        SetSliderValuesForSkill(mcm, "Smithing")
    elseIf optionId == mcm.oid_Skills_Block_Slider
        SetSliderValuesForSkill(mcm, "Block")
    elseIf optionId == mcm.oid_Skills_Sneak_Slider
        SetSliderValuesForSkill(mcm, "Sneak")
    elseIf optionId == mcm.oid_Skills_Speechcraft_Slider
        SetSliderValuesForSkill(mcm, "Speechcraft")
    ; Pickpocket/Lockpicking
    elseIf optionId == mcm.oid_Skills_Lockpicking_Slider
        SetSliderValuesForSkill(mcm, "Lockpicking")
    elseIf optionId == mcm.oid_Skills_Pickpocket_Slider
        SetSliderValuesForSkill(mcm, "Pickpocket")
    ; Magic
    elseIf optionId == mcm.oid_Skills_Alteration_Slider
        SetSliderValuesForSkill(mcm, "Alteration")
    elseIf optionId == mcm.oid_Skills_Conjuration_Slider
        SetSliderValuesForSkill(mcm, "Conjuration")
    elseIf optionId == mcm.oid_Skills_Destruction_Slider
        SetSliderValuesForSkill(mcm, "Destruction")
    elseIf optionId == mcm.oid_Skills_Illusion_Slider
        SetSliderValuesForSkill(mcm, "Illusion")
    elseIf optionId == mcm.oid_Skills_Restoration_Slider
        SetSliderValuesForSkill(mcm, "Restoration")
    ; Magic Skills
    elseIf optionId == mcm.oid_Skills_Alchemy_Slider
        SetSliderValuesForSkill(mcm, "Alchemy")
    elseIf optionId == mcm.oid_Skills_Enchanting_Slider
        SetSliderValuesForSkill(mcm, "Enchanting")
    endIf
endFunction

function OnOptionSliderAccept(ApprenticeMCM mcm, int optionId, float value) global
    ; Armor
    if optionId == mcm.oid_Skills_LightArmor_Slider
        SetAV("LightArmor", value)
        mcm.SetSliderOptionValue(mcm.oid_Skills_LightArmor_Slider, value)
    elseIf optionId == mcm.oid_Skills_HeavyArmor_Slider
        SetAV("HeavyArmor", value)
        mcm.SetSliderOptionValue(mcm.oid_Skills_HeavyArmor_Slider, value)
    ; Weapons
    elseIf optionId == mcm.oid_Skills_OneHanded_Slider
        SetAV("OneHanded", value)
        mcm.SetSliderOptionValue(mcm.oid_Skills_OneHanded_Slider, value)
    elseIf optionId == mcm.oid_Skills_TwoHanded_Slider
        SetAV("TwoHanded", value)
        mcm.SetSliderOptionValue(mcm.oid_Skills_TwoHanded_Slider, value)
    elseIf optionId == mcm.oid_Skills_Marksman_Slider
        SetAV("Marksman", value)
        mcm.SetSliderOptionValue(mcm.oid_Skills_Marksman_Slider, value)
    ; Other
    elseIf optionId == mcm.oid_Skills_Smithing_Slider
        SetAV("Smithing", value)
        mcm.SetSliderOptionValue(mcm.oid_Skills_Smithing_Slider, value)
    elseIf optionId == mcm.oid_Skills_Block_Slider
        SetAV("Block", value)
        mcm.SetSliderOptionValue(mcm.oid_Skills_Block_Slider, value)
    elseIf optionId == mcm.oid_Skills_Sneak_Slider
        SetAV("Sneak", value)
        mcm.SetSliderOptionValue(mcm.oid_Skills_Sneak_Slider, value)
    elseIf optionId == mcm.oid_Skills_Speechcraft_Slider
        SetAV("Speechcraft", value)
        mcm.SetSliderOptionValue(mcm.oid_Skills_Speechcraft_Slider, value)
    ; Pickpocket/Lockpicking
    elseIf optionId == mcm.oid_Skills_Lockpicking_Slider
        SetAV("Lockpicking", value)
        mcm.SetSliderOptionValue(mcm.oid_Skills_Lockpicking_Slider, value)
    elseIf optionId == mcm.oid_Skills_Pickpocket_Slider
        SetAV("Pickpocket", value)
        mcm.SetSliderOptionValue(mcm.oid_Skills_Pickpocket_Slider, value)
    ; Magic
    elseIf optionId == mcm.oid_Skills_Alteration_Slider
        SetAV("Alteration", value)
        mcm.SetSliderOptionValue(mcm.oid_Skills_Alteration_Slider, value)
    elseIf optionId == mcm.oid_Skills_Conjuration_Slider
        SetAV("Conjuration", value)
        mcm.SetSliderOptionValue(mcm.oid_Skills_Conjuration_Slider, value)
    elseIf optionId == mcm.oid_Skills_Destruction_Slider
        SetAV("Destruction", value)
        mcm.SetSliderOptionValue(mcm.oid_Skills_Destruction_Slider, value)
    elseIf optionId == mcm.oid_Skills_Illusion_Slider
        SetAV("Illusion", value)
        mcm.SetSliderOptionValue(mcm.oid_Skills_Illusion_Slider, value)
    elseIf optionId == mcm.oid_Skills_Restoration_Slider
        SetAV("Restoration", value)
        mcm.SetSliderOptionValue(mcm.oid_Skills_Restoration_Slider, value)
    ; Magic Skills
    elseIf optionId == mcm.oid_Skills_Alchemy_Slider
        SetAV("Alchemy", value)
        mcm.SetSliderOptionValue(mcm.oid_Skills_Alchemy_Slider, value)
    elseIf optionId == mcm.oid_Skills_Enchanting_Slider
        SetAV("Enchanting", value)
        mcm.SetSliderOptionValue(mcm.oid_Skills_Enchanting_Slider, value)
    endIf
endFunction

function OnOptionSelect(ApprenticeMCM mcm, int optionId) global
    if optionId == mcm.oid_StartingCharacter_ResetSkillsToZero
        ResetAllSkillsToZero(mcm)
    endIf
endFunction

function OnOptionHighlight(ApprenticeMCM mcm, int optionId) global
    if optionId == mcm.oid_StartingCharacter_ResetSkillsToZero
        mcm.SetInfoText("Sets all character skills to zero")
    endIf
endFunction

function ResetAllSkillsToZero(ApprenticeMCM mcm) global
    SetAV("Alteration", 0)
    SetAV("Conjuration", 0)
    SetAV("Destruction", 0)
    SetAV("Illusion", 0)
    SetAV("Restoration", 0)

    SetAV("Alchemy", 0)
    SetAV("Enchanting", 0)

    SetAV("LightArmor", 0)
    SetAV("HeavyArmor", 0)
    SetAV("Block", 0)

    SetAV("OneHanded", 0)
    SetAV("TwoHanded", 0)
    SetAV("Marksman", 0)

    SetAV("Sneak", 0)
    SetAV("Lockpicking", 0)
    SetAV("Pickpocket", 0)

    SetAV("Speechcraft", 0)
    SetAV("Smithing", 0)

    float value = 0.0
    mcm.SetSliderOptionValue(mcm.oid_Skills_LightArmor_Slider, value)
    mcm.SetSliderOptionValue(mcm.oid_Skills_HeavyArmor_Slider, value)
    mcm.SetSliderOptionValue(mcm.oid_Skills_OneHanded_Slider, value)
    mcm.SetSliderOptionValue(mcm.oid_Skills_TwoHanded_Slider, value)
    mcm.SetSliderOptionValue(mcm.oid_Skills_Marksman_Slider, value)
    mcm.SetSliderOptionValue(mcm.oid_Skills_Smithing_Slider, value)
    mcm.SetSliderOptionValue(mcm.oid_Skills_Block_Slider, value)
    mcm.SetSliderOptionValue(mcm.oid_Skills_Sneak_Slider, value)
    mcm.SetSliderOptionValue(mcm.oid_Skills_Speechcraft_Slider, value)
    mcm.SetSliderOptionValue(mcm.oid_Skills_Lockpicking_Slider, value)
    mcm.SetSliderOptionValue(mcm.oid_Skills_Pickpocket_Slider, value)
    mcm.SetSliderOptionValue(mcm.oid_Skills_Alteration_Slider, value)
    mcm.SetSliderOptionValue(mcm.oid_Skills_Conjuration_Slider, value)
    mcm.SetSliderOptionValue(mcm.oid_Skills_Destruction_Slider, value)
    mcm.SetSliderOptionValue(mcm.oid_Skills_Illusion_Slider, value)
    mcm.SetSliderOptionValue(mcm.oid_Skills_Restoration_Slider, value)
    mcm.SetSliderOptionValue(mcm.oid_Skills_Alchemy_Slider, value)
    mcm.SetSliderOptionValue(mcm.oid_Skills_Enchanting_Slider, value)

    mcm.SetTextOptionValue(mcm.oid_StartingCharacter_ResetSkillsToZero, "Updated all skills to zero!")
endFunction


    ; if optionId == mcm.oid_AvailablePerkCount_Slider
    ;     int currentPoints = Game.GetPerkPoints()
    ;     mcm.SetSliderDialogDefaultValue(currentPoints)
    ;     mcm.SetSliderDialogStartValue(currentPoints)
    ;     mcm.SetSliderDialogRange(0, 100)
    ;     mcm.SetSliderDialogInterval(1)
    ; if optionId == mcm.oid_AvailablePerkCount_Slider
    ;     Game.SetPerkPoints(value as int)
    ;     mcm.SetSliderOptionValue(mcm.oid_AvailablePerkCount_Slider, value as int)
    ; endIf