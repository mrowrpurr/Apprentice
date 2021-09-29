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

function Armor(ApprenticeMCM mcm) global
    mcm.AddHeaderOption("Armor")
    mcm.oid_Skills_LightArmor_Slider = mcm.AddSliderOption("Light Armor", mcm.GetAV("LightArmor"), a_flags = mcm.LockableOptionFlag)
    mcm.oid_Skills_HeavyArmor_Slider = mcm.AddSliderOption("Heavy Armor", mcm.GetAV("LightArmor"), a_flags = mcm.LockableOptionFlag)
endFunction

function Weapons(ApprenticeMCM mcm) global
    mcm.AddHeaderOption("Weapons")
    mcm.oid_Skills_OneHanded_Slider = mcm.AddSliderOption("One-Handed", mcm.GetAV("OneHanded"), a_flags = mcm.LockableOptionFlag)
    mcm.oid_Skills_TwoHanded_Slider = mcm.AddSliderOption("Two-Handed", mcm.GetAV("TwoHanded"), a_flags = mcm.LockableOptionFlag)
    mcm.oid_Skills_Marksman_Slider = mcm.AddSliderOption("Marksman", mcm.GetAV("Marksman"), a_flags = mcm.LockableOptionFlag)
endFunction

function MoreSkills(ApprenticeMCM mcm) global
    mcm.AddHeaderOption("More Skills")
    mcm.oid_Skills_Smithing_Slider = mcm.AddSliderOption("Smithing", mcm.GetAV("Smithing"), a_flags = mcm.LockableOptionFlag)
    mcm.oid_Skills_Block_Slider = mcm.AddSliderOption("Block", mcm.GetAV("Block"), a_flags = mcm.LockableOptionFlag)
    mcm.oid_Skills_Speechcraft_Slider = mcm.AddSliderOption("Speech", mcm.GetAV("Speechcraft"), a_flags = mcm.LockableOptionFlag)
    mcm.oid_Skills_Sneak_Slider = mcm.AddSliderOption("Sneak", mcm.GetAV("Sneak"), a_flags = mcm.LockableOptionFlag)
endFunction

function LockpickingAndPickpocket(ApprenticeMCM mcm) global
    mcm.AddHeaderOption("Lockpicking & Pickpocket")
    mcm.oid_Skills_Lockpicking_Slider = mcm.AddSliderOption("Lockpicking", mcm.GetAV("Lockpicking"), a_flags = mcm.LockableOptionFlag)
    mcm.oid_Skills_Pickpocket_Slider = mcm.AddSliderOption("Pickpocket", mcm.GetAV("Pickpocket"), a_flags = mcm.LockableOptionFlag)
endFunction

function Magic(ApprenticeMCM mcm) global
    mcm.AddHeaderOption("Magic")
    mcm.oid_Skills_Alteration_Slider = mcm.AddSliderOption("Alteration", mcm.GetAV("Alteration"), a_flags = mcm.LockableOptionFlag)
    mcm.oid_Skills_Conjuration_Slider = mcm.AddSliderOption("Conjuration", mcm.GetAV("Conjuration"), a_flags = mcm.LockableOptionFlag)
    mcm.oid_Skills_Destruction_Slider = mcm.AddSliderOption("Destruction", mcm.GetAV("Destruction"), a_flags = mcm.LockableOptionFlag)
    mcm.oid_Skills_Illusion_Slider = mcm.AddSliderOption("Illusion", mcm.GetAV("Illusion"), a_flags = mcm.LockableOptionFlag)
    mcm.oid_Skills_Restoration_Slider = mcm.AddSliderOption("Restoration", mcm.GetAV("Restoration"), a_flags = mcm.LockableOptionFlag)
endFunction

function MagicSkills(ApprenticeMCM mcm) global
    mcm.oid_Skills_Alchemy_Slider = mcm.AddSliderOption("Alchemy", mcm.GetAV("Alchemy"), a_flags = mcm.LockableOptionFlag)
    mcm.oid_Skills_Enchanting_Slider = mcm.AddSliderOption("Enchanting", mcm.GetAV("Enchanting"), a_flags = mcm.LockableOptionFlag)
endFunction

function SetSliderValuesForSkill(ApprenticeMCM mcm, string skillName) global
    float skillValue = mcm.GetAV(skillName)
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
        mcm.SetAV("LightArmor", value)
        mcm.SetSliderOptionValue(mcm.oid_Skills_LightArmor_Slider, value)
    elseIf optionId == mcm.oid_Skills_HeavyArmor_Slider
        mcm.SetAV("HeavyArmor", value)
        mcm.SetSliderOptionValue(mcm.oid_Skills_HeavyArmor_Slider, value)
    ; Weapons
    elseIf optionId == mcm.oid_Skills_OneHanded_Slider
        mcm.SetAV("OneHanded", value)
        mcm.SetSliderOptionValue(mcm.oid_Skills_OneHanded_Slider, value)
    elseIf optionId == mcm.oid_Skills_TwoHanded_Slider
        mcm.SetAV("TwoHanded", value)
        mcm.SetSliderOptionValue(mcm.oid_Skills_TwoHanded_Slider, value)
    elseIf optionId == mcm.oid_Skills_Marksman_Slider
        mcm.SetAV("Marksman", value)
        mcm.SetSliderOptionValue(mcm.oid_Skills_Marksman_Slider, value)
    ; Other
    elseIf optionId == mcm.oid_Skills_Smithing_Slider
        mcm.SetAV("Smithing", value)
        mcm.SetSliderOptionValue(mcm.oid_Skills_Smithing_Slider, value)
    elseIf optionId == mcm.oid_Skills_Block_Slider
        mcm.SetAV("Block", value)
        mcm.SetSliderOptionValue(mcm.oid_Skills_Block_Slider, value)
    elseIf optionId == mcm.oid_Skills_Sneak_Slider
        mcm.SetAV("Sneak", value)
        mcm.SetSliderOptionValue(mcm.oid_Skills_Sneak_Slider, value)
    elseIf optionId == mcm.oid_Skills_Speechcraft_Slider
        mcm.SetAV("Speechcraft", value)
        mcm.SetSliderOptionValue(mcm.oid_Skills_Speechcraft_Slider, value)
    ; Pickpocket/Lockpicking
    elseIf optionId == mcm.oid_Skills_Lockpicking_Slider
        mcm.SetAV("Lockpicking", value)
        mcm.SetSliderOptionValue(mcm.oid_Skills_Lockpicking_Slider, value)
    elseIf optionId == mcm.oid_Skills_Pickpocket_Slider
        mcm.SetAV("Pickpocket", value)
        mcm.SetSliderOptionValue(mcm.oid_Skills_Pickpocket_Slider, value)
    ; Magic
    elseIf optionId == mcm.oid_Skills_Alteration_Slider
        mcm.SetAV("Alteration", value)
        mcm.SetSliderOptionValue(mcm.oid_Skills_Alteration_Slider, value)
    elseIf optionId == mcm.oid_Skills_Conjuration_Slider
        mcm.SetAV("Conjuration", value)
        mcm.SetSliderOptionValue(mcm.oid_Skills_Conjuration_Slider, value)
    elseIf optionId == mcm.oid_Skills_Destruction_Slider
        mcm.SetAV("Destruction", value)
        mcm.SetSliderOptionValue(mcm.oid_Skills_Destruction_Slider, value)
    elseIf optionId == mcm.oid_Skills_Illusion_Slider
        mcm.SetAV("Illusion", value)
        mcm.SetSliderOptionValue(mcm.oid_Skills_Illusion_Slider, value)
    elseIf optionId == mcm.oid_Skills_Restoration_Slider
        mcm.SetAV("Restoration", value)
        mcm.SetSliderOptionValue(mcm.oid_Skills_Restoration_Slider, value)
    ; Magic Skills
    elseIf optionId == mcm.oid_Skills_Alchemy_Slider
        mcm.SetAV("Alchemy", value)
        mcm.SetSliderOptionValue(mcm.oid_Skills_Alchemy_Slider, value)
    elseIf optionId == mcm.oid_Skills_Enchanting_Slider
        mcm.SetAV("Enchanting", value)
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
    mcm.SetAV("Alteration", 0)
    mcm.SetAV("Conjuration", 0)
    mcm.SetAV("Destruction", 0)
    mcm.SetAV("Illusion", 0)
    mcm.SetAV("Restoration", 0)

    mcm.SetAV("Alchemy", 0)
    mcm.SetAV("Enchanting", 0)

    mcm.SetAV("LightArmor", 0)
    mcm.SetAV("HeavyArmor", 0)
    mcm.SetAV("Block", 0)

    mcm.SetAV("OneHanded", 0)
    mcm.SetAV("TwoHanded", 0)
    mcm.SetAV("Marksman", 0)

    mcm.SetAV("Sneak", 0)
    mcm.SetAV("Lockpicking", 0)
    mcm.SetAV("Pickpocket", 0)

    mcm.SetAV("Speechcraft", 0)
    mcm.SetAV("Smithing", 0)

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
