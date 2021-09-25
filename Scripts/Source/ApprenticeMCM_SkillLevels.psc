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
    ; PerkPoints(mcm)
    LockpickingAndPickpocket(mcm)
    Magic(mcm)
    MagicSkills(mcm)
endFunction

; function LockAllOptions(ApprenticeMCM mcm) global
;     mcm.oid_Settings_LockSkillLevelsMenu = mcm.AddTextOption("", "Click here to lock these options")
; endFunction

function PerkPoints(ApprenticeMCM mcm) global
    mcm.AddHeaderOption("Perks Points")
    mcm.oid_AvailablePerkCount_Slider = mcm.AddSliderOption("Points Available", Game.GetPerkPoints(), a_flags = mcm.LockableOptionFlag)
endFunction

float function GetAV(string skillName) global
    return Game.GetPlayer().GetActorValue(skillName)
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
    mcm.AddHeaderOption("Magic Skills")
    mcm.oid_Skills_Alchemy_Slider = mcm.AddSliderOption("Alchemy", GetAV("Alchemy"), a_flags = mcm.LockableOptionFlag)
    mcm.oid_Skills_Enchanting_Slider = mcm.AddSliderOption("Enchanting", GetAV("Enchanting"), a_flags = mcm.LockableOptionFlag)
endFunction

function OnOptionSliderOpen(ApprenticeMCM mcm, int optionId) global
    if optionId == mcm.oid_AvailablePerkCount_Slider
        int currentPoints = Game.GetPerkPoints()
        mcm.SetSliderDialogDefaultValue(currentPoints)
        mcm.SetSliderDialogStartValue(currentPoints)
        mcm.SetSliderDialogRange(0, 100)
        mcm.SetSliderDialogInterval(1)
    else
        Debug.MessageBox("We don't support this slider yet " + optionId)
    endIf
endFunction

function OnOptionSliderAccept(ApprenticeMCM mcm, int optionId, float value) global
    if optionId == mcm.oid_AvailablePerkCount_Slider
        Game.SetPerkPoints(value as int)
        mcm.SetSliderOptionValue(mcm.oid_AvailablePerkCount_Slider, value as int)
    endIf
endFunction
