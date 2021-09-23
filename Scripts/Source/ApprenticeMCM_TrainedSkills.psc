scriptName ApprenticeMCM_TrainedSkills hidden

function Render(ApprenticeMCM mcm, string page) global
    mcm.SetCursorFillMode(mcm.TOP_TO_BOTTOM)
    LeftColumn(mcm)
    mcm.SetCursorPosition(1)
    RightColumn(mcm)
endFunction

function LeftColumn(ApprenticeMCM mcm) global
    Armor(mcm)
    Weapons(mcm)
    Smithing(mcm)
    Blocking(mcm)
endFunction

function RightColumn(ApprenticeMCM mcm) global
    Magic(mcm)
    MagicSkills(mcm)
endFunction

function Armor(ApprenticeMCM mcm) global
    mcm.AddHeaderOption("Armor")
    mcm.oid_TrainedSkills_Armor_LightArmor_Toggle = mcm.AddToggleOption("Light Armor", mcm.Apprentice_Training_LightArmor.GetValueInt() == 1)
    mcm.oid_TrainedSkills_Armor_HeavyArmor_Toggle = mcm.AddToggleOption("Heavy Armor", mcm.Apprentice_Training_HeavyArmor.GetValueInt() == 1)
endFunction

function Smithing(ApprenticeMCM mcm) global
    mcm.AddHeaderOption("Smithing")
    mcm.oid_TrainedSkills_Smithing_Toggle = mcm.AddToggleOption("Smithing", mcm.Apprentice_Training_Smithing.GetValueInt() == 1)
endFunction

function Blocking(ApprenticeMCM mcm) global
    mcm.AddHeaderOption("Block")
    mcm.oid_TrainedSkills_Block_Toggle = mcm.AddToggleOption("Block", mcm.Apprentice_Training_Block.GetValueInt() == 1)
endFunction

function MagicSkills(ApprenticeMCM mcm) global
    mcm.AddHeaderOption("Magic Skills")
    mcm.oid_TrainedSkills_Magic_Alchemy_Toggle = mcm.AddToggleOption("Alchemy", mcm.Apprentice_Training_Alchemy.GetValueInt() == 1)
    mcm.oid_TrainedSkills_Magic_Enchanting_Toggle = mcm.AddToggleOption("Enchanting", mcm.Apprentice_Training_Enchanting.GetValueInt() == 1)
endFunction

function Magic(ApprenticeMCM mcm) global
    mcm.AddHeaderOption("Magic")
    mcm.oid_TrainedSkills_Magic_Alteration_Toggle = mcm.AddToggleOption("Alteration", mcm.Apprentice_Training_Alteration.GetValueInt() == 1)
    mcm.oid_TrainedSkills_Magic_Conjuration_Toggle = mcm.AddToggleOption("Conjuration", mcm.Apprentice_Training_Conjuration.GetValueInt() == 1)
    mcm.oid_TrainedSkills_Magic_Destruction_Toggle = mcm.AddToggleOption("Destruction", mcm.Apprentice_Training_Destruction.GetValueInt() == 1)
    mcm.oid_TrainedSkills_Magic_Illusion_Toggle = mcm.AddToggleOption("Illusion", mcm.Apprentice_Training_Illusion.GetValueInt() == 1)
    mcm.oid_TrainedSkills_Magic_Restoration_Toggle = mcm.AddToggleOption("Restoration", mcm.Apprentice_Training_Restoration.GetValueInt() == 1)
endFunction

function Weapons(ApprenticeMCM mcm) global
    mcm.AddHeaderOption("Weapons")
    mcm.oid_TrainedSkills_Weapons_OneHanded_Toggle = mcm.AddToggleOption("One Handed", mcm.Apprentice_Training_OneHanded.GetValueInt() == 1)
    mcm.oid_TrainedSkills_Weapons_TwoHanded_Toggle = mcm.AddToggleOption("Two Handed", mcm.Apprentice_Training_TwoHanded.GetValueInt() == 1)
    mcm.oid_TrainedSkills_Weapons_Marksman_Toggle = mcm.AddToggleOption("Archery", mcm.Apprentice_Training_Marksman.GetValueInt() == 1)
endFunction

function OnOptionSelect(ApprenticeMCM mcm, int optionId) global
    ; Armor
    if optionId == mcm.oid_TrainedSkills_Armor_LightArmor_Toggle
        if mcm.Apprentice_Training_LightArmor.GetValueInt() == 1
            mcm.Apprentice_Training_LightArmor.SetValueInt(0)
            mcm.SetToggleOptionValue(mcm.oid_TrainedSkills_Armor_LightArmor_Toggle, false)
        else
            mcm.Apprentice_Training_LightArmor.SetValueInt(1)
            mcm.SetToggleOptionValue(mcm.oid_TrainedSkills_Armor_LightArmor_Toggle, true)
        endIf
    elseIf optionId == mcm.oid_TrainedSkills_Armor_HeavyArmor_Toggle
        if mcm.Apprentice_Training_HeavyArmor.GetValueInt() == 1
            mcm.Apprentice_Training_HeavyArmor.SetValueInt(0)
            mcm.SetToggleOptionValue(mcm.oid_TrainedSkills_Armor_HeavyArmor_Toggle, false)
        else
            mcm.Apprentice_Training_HeavyArmor.SetValueInt(1)
            mcm.SetToggleOptionValue(mcm.oid_TrainedSkills_Armor_HeavyArmor_Toggle, true)
        endIf

    ; Smithing
    elseIf optionId == mcm.oid_TrainedSkills_Smithing_Toggle
        if mcm.Apprentice_Training_Smithing.GetValueInt() == 1
            mcm.Apprentice_Training_Smithing.SetValueInt(0)
            mcm.SetToggleOptionValue(mcm.oid_TrainedSkills_Smithing_Toggle, false)
        else
            mcm.Apprentice_Training_Smithing.SetValueInt(1)
            mcm.SetToggleOptionValue(mcm.oid_TrainedSkills_Smithing_Toggle, true)
        endIf

    ; Blocking
    elseIf optionId == mcm.oid_TrainedSkills_Block_Toggle
        if mcm.Apprentice_Training_Block.GetValueInt() == 1
            mcm.Apprentice_Training_Block.SetValueInt(0)
            mcm.SetToggleOptionValue(mcm.oid_TrainedSkills_Block_Toggle, false)
        else
            mcm.Apprentice_Training_Block.SetValueInt(1)
            mcm.SetToggleOptionValue(mcm.oid_TrainedSkills_Block_Toggle, true)
        endIf

    ; Weapons
    elseIf optionId == mcm.oid_TrainedSkills_Weapons_OneHanded_Toggle
        if mcm.Apprentice_Training_OneHanded.GetValueInt() == 1
            mcm.Apprentice_Training_OneHanded.SetValueInt(0)
            mcm.SetToggleOptionValue(mcm.oid_TrainedSkills_Weapons_OneHanded_Toggle, false)
        else
            mcm.Apprentice_Training_OneHanded.SetValueInt(1)
            mcm.SetToggleOptionValue(mcm.oid_TrainedSkills_Weapons_OneHanded_Toggle, true)
        endIf

    elseIf optionId == mcm.oid_TrainedSkills_Weapons_TwoHanded_Toggle
        if mcm.Apprentice_Training_TwoHanded.GetValueInt() == 1
            mcm.Apprentice_Training_TwoHanded.SetValueInt(0)
            mcm.SetToggleOptionValue(mcm.oid_TrainedSkills_Weapons_TwoHanded_Toggle, false)
        else
            mcm.Apprentice_Training_TwoHanded.SetValueInt(1)
            mcm.SetToggleOptionValue(mcm.oid_TrainedSkills_Weapons_TwoHanded_Toggle, true)
        endIf

    elseIf optionId == mcm.oid_TrainedSkills_Weapons_Marksman_Toggle
        if mcm.Apprentice_Training_Marksman.GetValueInt() == 1
            mcm.Apprentice_Training_Marksman.SetValueInt(0)
            mcm.SetToggleOptionValue(mcm.oid_TrainedSkills_Weapons_Marksman_Toggle, false)
        else
            mcm.Apprentice_Training_Marksman.SetValueInt(1)
            mcm.SetToggleOptionValue(mcm.oid_TrainedSkills_Weapons_Marksman_Toggle, true)
        endIf

    ; Magic Skills
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

    ; Magic
    elseIf optionId == mcm.oid_TrainedSkills_Magic_Alteration_Toggle
        if mcm.Apprentice_Training_Alteration.GetValueInt() == 1
            mcm.Apprentice_Training_Alteration.SetValueInt(0)
            mcm.SetToggleOptionValue(mcm.oid_TrainedSkills_Magic_Alteration_Toggle, false)
        else
            mcm.Apprentice_Training_Alteration.SetValueInt(1)
            mcm.SetToggleOptionValue(mcm.oid_TrainedSkills_Magic_Alteration_Toggle, true)
        endIf

    elseIf optionId == mcm.oid_TrainedSkills_Magic_Conjuration_Toggle
        if mcm.Apprentice_Training_Conjuration.GetValueInt() == 1
            mcm.Apprentice_Training_Conjuration.SetValueInt(0)
            mcm.SetToggleOptionValue(mcm.oid_TrainedSkills_Magic_Conjuration_Toggle, false)
        else
            mcm.Apprentice_Training_Conjuration.SetValueInt(1)
            mcm.SetToggleOptionValue(mcm.oid_TrainedSkills_Magic_Conjuration_Toggle, true)
        endIf

    elseIf optionId == mcm.oid_TrainedSkills_Magic_Destruction_Toggle
        if mcm.Apprentice_Training_Destruction.GetValueInt() == 1
            mcm.Apprentice_Training_Destruction.SetValueInt(0)
            mcm.SetToggleOptionValue(mcm.oid_TrainedSkills_Magic_Destruction_Toggle, false)
        else
            mcm.Apprentice_Training_Destruction.SetValueInt(1)
            mcm.SetToggleOptionValue(mcm.oid_TrainedSkills_Magic_Destruction_Toggle, true)
        endIf

    elseIf optionId == mcm.oid_TrainedSkills_Magic_Illusion_Toggle
        if mcm.Apprentice_Training_Illusion.GetValueInt() == 1
            mcm.Apprentice_Training_Illusion.SetValueInt(0)
            mcm.SetToggleOptionValue(mcm.oid_TrainedSkills_Magic_Illusion_Toggle, false)
        else
            mcm.Apprentice_Training_Illusion.SetValueInt(1)
            mcm.SetToggleOptionValue(mcm.oid_TrainedSkills_Magic_Illusion_Toggle, true)
        endIf

    elseIf optionId == mcm.oid_TrainedSkills_Magic_Restoration_Toggle
        if mcm.Apprentice_Training_Restoration.GetValueInt() == 1
            mcm.Apprentice_Training_Restoration.SetValueInt(0)
            mcm.SetToggleOptionValue(mcm.oid_TrainedSkills_Magic_Restoration_Toggle, false)
        else
            mcm.Apprentice_Training_Restoration.SetValueInt(1)
            mcm.SetToggleOptionValue(mcm.oid_TrainedSkills_Magic_Restoration_Toggle, true)
        endIf
    endIf
endFunction

function OnOptionHighlight(ApprenticeMCM mcm, int optionId) global
    ; Armor
    if optionId == mcm.oid_TrainedSkills_Armor_LightArmor_Toggle
        mcm.SetInfoText("Toggle Training in Light Armor (required to equip light armor)")
    elseIf optionId == mcm.oid_TrainedSkills_Armor_HeavyArmor_Toggle
        mcm.SetInfoText("Toggle Training in Heavy Armor (required to equip heavy armor)")
    ; Smithing
    elseIf optionId == mcm.oid_TrainedSkills_Smithing_Toggle
        mcm.SetInfoText("Toggle Training in Smithing (required to use smithing crafting stations)")
    ; Blocking
    elseIf optionId == mcm.oid_TrainedSkills_Block_Toggle
        mcm.SetInfoText("Toggle Training in Block (required to use shields)")
    ; Weapons
    elseIf optionId == mcm.oid_TrainedSkills_Weapons_OneHanded_Toggle
        mcm.SetInfoText("Toggle Training in One-Handed Weapons (required to equip one-handed weapons)")
    elseIf optionId == mcm.oid_TrainedSkills_Weapons_TwoHanded_Toggle
        mcm.SetInfoText("Toggle Training in Two-Handed Weapons (required to equip two-handed weapons)")
    elseIf optionId == mcm.oid_TrainedSkills_Weapons_Marksman_Toggle
        mcm.SetInfoText("Toggle Training in Archery (required to equip bows)")
    ; Magic Skills
    elseIf optionId == mcm.oid_TrainedSkills_Magic_Alchemy_Toggle
        mcm.SetInfoText("Toggle Training in Alchemy (required to use alchemy tables)")
    elseIf optionId == mcm.oid_TrainedSkills_Magic_Enchanting_Toggle
        mcm.SetInfoText("Toggle Training in Enchanting (required to use enchanting tables")
    ; Magic
    elseIf optionId == mcm.oid_TrainedSkills_Magic_Alteration_Toggle
        mcm.SetInfoText("Toggle Training in Alteration (required to cast Alteration spells or equip Alteration-enchanted items)")
    elseIf optionId == mcm.oid_TrainedSkills_Magic_Conjuration_Toggle
        mcm.SetInfoText("Toggle Training in Conjuration (required to cast Conjuration spells or equip Conjuration-enchanted items)")
    elseIf optionId == mcm.oid_TrainedSkills_Magic_Destruction_Toggle
        mcm.SetInfoText("Toggle Training in Destruction (required to cast Destruction spells or equip Destruction-enchanted items)")
    elseIf optionId == mcm.oid_TrainedSkills_Magic_Illusion_Toggle
        mcm.SetInfoText("Toggle Training in Illusion (required to cast Illusion spells or equip Illusion-enchanted items)")
    elseIf optionId == mcm.oid_TrainedSkills_Magic_Restoration_Toggle
        mcm.SetInfoText("Toggle Training in Restoration (required to cast Restoration spells or equip Restoration-enchanted items)")
    endIf
endFunction
