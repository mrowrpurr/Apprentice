Scriptname ApprenticePlayer extends ReferenceAlias  
{This is the Apprentice player script.}

; TODO - Add Smithing and don't allow using ANY SMITHING items if not trained in smithing yet

; Armor
GlobalVariable property Apprentice_Training_HeavyArmor auto
GlobalVariable property Apprentice_Training_LightArmor auto

; Weapons
GlobalVariable property Apprentice_Training_OneHanded auto
GlobalVariable property Apprentice_Training_TwoHanded auto
GlobalVariable property Apprentice_Training_Marksman auto

; Magic Skills
GlobalVariable property Apprentice_Training_Alchemy auto
GlobalVariable property Apprentice_Training_Enchanting auto

; Magic
GlobalVariable property Apprentice_Training_Alteration auto
GlobalVariable property Apprentice_Training_Conjuration auto
GlobalVariable property Apprentice_Training_Illusion auto
GlobalVariable property Apprentice_Training_Restoration auto
GlobalVariable property Apprentice_Training_Destruction auto

; Smithing
GlobalVariable property Apprentice_Training_Smithing auto

; Block
GlobalVariable property Apprentice_Training_Block auto

; Note: For enchantments, we should only let you equip the item
;       if you are familiar with (aka trained in) the associated skill.

; Skill Books - require a few to unlock skill!

Armor MostRecentlyWornArmor

event OnInit()
    ListenForEvents()
endEvent

event OnPlayerLoadGame()
    ListenForEvents()
endEvent

function ListenForEvents()
    RegisterForMenu("Crafting Menu")
    RegisterForMenu("CraftingMenu")
    RegisterForMenu("InventoryMenu")

    int jumpKey = Input.GetMappedKey("Jump")
    RegisterForKey(jumpKey)

    ; RegisterForMenu("Training Menu")
    PO3_Events_Alias.RegisterForSkillIncrease(self)
endFunction

event OnKeyDown(int keyCode)
    Actor player = GetActorReference()
    Form gold = Game.GetForm(0xf)
    int goldCount = player.GetItemCount(gold)
    if goldCount && Utility.RandomInt(1, 100) < 10
        player.DropObject(gold, 1)
    endIf
endEvent

event OnMenuClose(string menuName)
    if UnequipOnMenuClose
        GetActorReference().UnequipItem(UnequipOnMenuClose)
        UnequipOnMenuClose = None
    endIf
endEvent

event OnMenuOpen(string menuName)
    string description = UI.GetString("Crafting Menu", "_global.CraftingMenu.CraftingMenuInstance.MenuDescription.text")

    if Apprentice_Training_Alchemy.GetValueInt() != 1 && StringUtil.Find(description, "Alchemy") > -1
        UI.Invoke("Crafting Menu", "_global.CraftingMenu.CraftingMenuInstance.onExitButtonPress")
        UI.Invoke("Crafting Menu", "_global.CraftingMenu.CraftingMenuInstance.onExitButtonPress")
        Input.TapKey(28) ; Enter
        Utility.WaitMenuMode(0.1)
        Input.TapKey(28) ; Enter
        Utility.WaitMenuMode(0.1)
        Input.TapKey(28) ; Enter
        Utility.WaitMenuMode(0.1)
        Input.TapKey(28) ; Enter
        Utility.WaitMenuMode(0.1)
        Debug.MessageBox("You need to train in Alchemy before you can use an Alchemy table")

    elseIf Apprentice_Training_Enchanting.GetValueInt() != 1 && StringUtil.Find(description, "Enchanting") > -1
        UI.Invoke("Crafting Menu", "_global.CraftingMenu.CraftingMenuInstance.onExitButtonPress")
        UI.Invoke("Crafting Menu", "_global.CraftingMenu.CraftingMenuInstance.onExitButtonPress")
        Utility.WaitMenuMode(0.1)
        Debug.MessageBox("You need to train in Enchanting before you can use an Enchanting table")
        
    elseIf Apprentice_Training_Smithing.GetValueInt() == 0 && (StringUtil.Find(description, "Tanning Rack") > -1 || StringUtil.Find(description, "Blacksmith Forge") > -1 || StringUtil.Find(description, "Weapon Smithing") > -1 || StringUtil.Find(description, "Armor Smithing") > -1 || StringUtil.Find(description, "Smelter") > -1)
        UI.Invoke("Crafting Menu", "_global.CraftingMenu.CraftingMenuInstance.onExitButtonPress")
        UI.Invoke("Crafting Menu", "_global.CraftingMenu.CraftingMenuInstance.onExitButtonPress")
        Utility.WaitMenuMode(0.1)
        Debug.MessageBox("You need to train in Smithing before you can use this")
    endIf
endEvent

event OnSkillIncrease(string trainedSkill)
    if trainedSkill == "OneHanded"
        Apprentice_Training_OneHanded.SetValueInt(1)
    elseIf trainedSkill == "TwoHanded"
        Apprentice_Training_TwoHanded.SetValueInt(1)
    elseIf trainedSkill  == "Marksman"
        Apprentice_Training_Marksman.SetValueInt(1)
    elseIf trainedSkill == "HeavyArmor"
        Apprentice_Training_HeavyArmor.SetValueInt(1)
    elseIf trainedSkill == "LightArmor"
        Apprentice_Training_LightArmor.SetValueInt(1)
    elseIf trainedSkill == "Restoration"
        Apprentice_Training_Restoration.SetValueInt(1)
    elseIf trainedSkill == "Alteration"
        Apprentice_Training_Alteration.SetValueInt(1)
    elseIf trainedSkill == "Destruction"
        Apprentice_Training_Destruction.SetValueInt(1)
    elseIf trainedSkill == "Conjuration"
        Apprentice_Training_Conjuration.SetValueInt(1)
    elseIf trainedSkill == "Illusion"
        Apprentice_Training_Illusion.SetValueInt(1)
    elseIf trainedSkill == "Alchemy"
        Apprentice_Training_Alchemy.SetValueInt(1)
    elseIf trainedSkill == "Enchanting"
        Apprentice_Training_Enchanting.SetValueInt(1)
    elseIf trainedSkill == "Smithing"
        Apprentice_Training_Smithing.SetValueInt(1)
    endIf
endEvent

Form property UnequipOnMenuClose auto

event OnObjectEquipped(Form object, ObjectReference instance)
    Actor player = GetActorReference()

    Weapon theWeapon = object as Weapon
    if theWeapon
        string skillName = theWeapon.GetSkill()
        if skillName == "OneHanded" && Apprentice_Training_OneHanded.GetValueInt() == 0
            Debug.MessageBox("You are not trained in One-Handed weapons.\n\nYou cannot equip this weapon until you get training in One-Handed weapons.")
            UnequipOnMenuClose = theWeapon
        elseIf skillName == "TwoHanded" && Apprentice_Training_TwoHanded.GetValueInt() == 0
            Debug.MessageBox("You are not trained in Two-Handed weapons.\n\nYou cannot equip this weapon until you get training in Two-Handed weapon.")
            UnequipOnMenuClose = theWeapon
        elseIf skillName == "Marksman" && Apprentice_Training_Marksman.GetValueInt() == 0
            Debug.MessageBox("You are not trained in Archery.\n\nYou cannot equip this weapon until you get training in Archery weapon.")
            UnequipOnMenuClose = theWeapon
        endIf
    endIf

    Spell theSpell = object as Spell
    if theSpell
        if IsAlterationSpell(theSpell) && Apprentice_Training_Alteration.GetValueInt() == 0
            Debug.MessageBox("You are not trained in Alteration spells.\n\nYou cannot cast this spell until you get training in Alteration.")
            GetActorReference().UnequipSpell(theSpell, 0)
            GetActorReference().UnequipSpell(theSpell, 1)
        elseIf IsConjurationSpell(theSpell) && Apprentice_Training_Conjuration.GetValueInt() == 0
            Debug.MessageBox("You are not trained in Conjuration spells.\n\nYou cannot cast this spell until you get training in Conjuration.")
            GetActorReference().UnequipSpell(theSpell, 0)
            GetActorReference().UnequipSpell(theSpell, 1)
        elseIf IsDestructionSpell(theSpell) && Apprentice_Training_Destruction.GetValueInt() == 0
            Debug.MessageBox("You are not trained in Destruction spells.\n\nYou cannot cast this spell until you get training in Destruction.")
            GetActorReference().UnequipSpell(theSpell, 0)
            GetActorReference().UnequipSpell(theSpell, 1)
        elseIf IsIllusionSpell(theSpell) && Apprentice_Training_Illusion.GetValueInt() == 0
            Debug.MessageBox("You are not trained in Illusion spells.\n\nYou cannot cast this spell until you get training in Illusion.")
            GetActorReference().UnequipSpell(theSpell, 0)
            GetActorReference().UnequipSpell(theSpell, 1)
        elseIf IsRestorationSpell(theSpell) && Apprentice_Training_Restoration.GetValueInt() == 0
            Debug.MessageBox("You are not trained in Restoration spells.\n\nYou cannot cast this spell until you get training in Restoration.")
            GetActorReference().UnequipSpell(theSpell, 0)
            GetActorReference().UnequipSpell(theSpell, 1)
        endIf
    endIf

    Scroll theScroll = object as Scroll
    if theScroll
        if IsAlterationScroll(theScroll) && Apprentice_Training_Alteration.GetValueInt() == 0
            Debug.MessageBox("You are not trained in Alteration spells.\n\nYou cannot cast this spell until you get training in Alteration.")
            UnequipOnMenuClose = theScroll
        elseIf IsConjurationScroll(theScroll) && Apprentice_Training_Conjuration.GetValueInt() == 0
            Debug.MessageBox("You are not trained in Conjuration spells.\n\nYou cannot cast this spell until you get training in Conjuration.")
            UnequipOnMenuClose = theScroll
        elseIf IsDestructionScroll(theScroll) && Apprentice_Training_Destruction.GetValueInt() == 0
            Debug.MessageBox("You are not trained in Destruction spells.\n\nYou cannot cast this spell until you get training in Destruction.")
            UnequipOnMenuClose = theScroll
        elseIf IsIllusionScroll(theScroll) && Apprentice_Training_Illusion.GetValueInt() == 0
            Debug.MessageBox("You are not trained in Illusion spells.\n\nYou cannot cast this spell until you get training in Illusion.")
            UnequipOnMenuClose = theScroll
        elseIf IsRestorationScroll(theScroll) && Apprentice_Training_Restoration.GetValueInt() == 0
            Debug.MessageBox("You are not trained in Restoration spells.\n\nYou cannot cast this spell until you get training in Restoration.")
            UnequipOnMenuClose = theScroll
        endIf
    endIf

    Armor theArmor = object as Armor
    if theArmor && IsArmor(theArmor)
        if theArmor.IsShield() && Apprentice_Training_Block.GetValueInt() == 0
            Debug.MessageBox("You are not trained in Block.\n\nYou equip a shielf until you get training in Block.")
            GetActorReference().UnequipItem(theArmor)
        else
            if IsHeavyArmor(theArmor) && Apprentice_Training_HeavyArmor.GetValueInt() == 0
                Debug.MessageBox("You are not trained in Heavy Armor.\n\nYou equip this armor until you get training in Heavy Armor.")
                GetActorReference().UnequipItem(theArmor)
                GetActorReference().EquipItem(MostRecentlyWornArmor)
            elseIf IsLightArmor(theArmor) && Apprentice_Training_LightArmor.GetValueInt() == 0
                Debug.MessageBox("You are not trained in Light Armor.\n\nYou equip this armor until you get training in Light Armor.")
                GetActorReference().UnequipItem(theArmor)
                GetActorReference().EquipItem(MostRecentlyWornArmor)
                ; Track it
                MostRecentlyWornArmor = theArmor
            endIf
        endIf
    endIf
endEvent

bool function IsAlterationSpell(Spell theSpell)
    bool isAlteration = true
    int magicEffectCount = theSpell.GetNumEffects()
    int i = 0
    while i < magicEffectCount && isAlteration
        MagicEffect theEffect = theSpell.GetNthEffectMagicEffect(i)
        string skillName = theEffect.GetAssociatedSkill()
        if skillName != "Alteration"
            isAlteration = false
        endIf
        i += 1
    endWhile
    return isAlteration
endFunction

bool function IsConjurationSpell(Spell theSpell)
    bool isConjuration = true
    int magicEffectCount = theSpell.GetNumEffects()
    int i = 0
    while i < magicEffectCount && isConjuration
        MagicEffect theEffect = theSpell.GetNthEffectMagicEffect(i)
        string skillName = theEffect.GetAssociatedSkill()
        if skillName != "Conjuration"
            isConjuration = false
        endIf
        i += 1
    endWhile
    return isConjuration
endFunction

bool function IsDestructionSpell(Spell theSpell)
    bool isDestruction = true
    int magicEffectCount = theSpell.GetNumEffects()
    int i = 0
    while i < magicEffectCount && isDestruction
        MagicEffect theEffect = theSpell.GetNthEffectMagicEffect(i)
        string skillName = theEffect.GetAssociatedSkill()
        if skillName != "Destruction"
            isDestruction = false
        endIf
        i += 1
    endWhile
    return isDestruction
endFunction

bool function IsIllusionSpell(Spell theSpell)
    bool isIllusion = true
    int magicEffectCount = theSpell.GetNumEffects()
    int i = 0
    while i < magicEffectCount && isIllusion
        MagicEffect theEffect = theSpell.GetNthEffectMagicEffect(i)
        string skillName = theEffect.GetAssociatedSkill()
        if skillName != "Illusion"
            isIllusion = false
        endIf
        i += 1
    endWhile
    return isIllusion
endFunction

bool function IsRestorationSpell(Spell theSpell)
    bool isRestoration = true
    int magicEffectCount = theSpell.GetNumEffects()
    int i = 0
    while i < magicEffectCount && isRestoration
        MagicEffect theEffect = theSpell.GetNthEffectMagicEffect(i)
        string skillName = theEffect.GetAssociatedSkill()
        if skillName != "Restoration"
            isRestoration = false
        endIf
        i += 1
    endWhile
    return isRestoration
endFunction

bool function IsAlterationScroll(Scroll theScroll)
    bool isAlteration = true
    int magicEffectCount = theScroll.GetNumEffects()
    int i = 0
    while i < magicEffectCount && isAlteration
        MagicEffect theEffect = theScroll.GetNthEffectMagicEffect(i)
        string skillName = theEffect.GetAssociatedSkill()
        if skillName != "Alteration"
            isAlteration = false
        endIf
        i += 1
    endWhile
    return isAlteration
endFunction

bool function IsConjurationScroll(Scroll theScroll)
    bool isConjuration = true
    int magicEffectCount = theScroll.GetNumEffects()
    int i = 0
    while i < magicEffectCount && isConjuration
        MagicEffect theEffect = theScroll.GetNthEffectMagicEffect(i)
        string skillName = theEffect.GetAssociatedSkill()
        if skillName != "Conjuration"
            isConjuration = false
        endIf
        i += 1
    endWhile
    return isConjuration
endFunction

bool function IsDestructionScroll(Scroll theScroll)
    bool isDestruction = true
    int magicEffectCount = theScroll.GetNumEffects()
    int i = 0
    while i < magicEffectCount && isDestruction
        MagicEffect theEffect = theScroll.GetNthEffectMagicEffect(i)
        string skillName = theEffect.GetAssociatedSkill()
        if skillName != "Destruction"
            isDestruction = false
        endIf
        i += 1
    endWhile
    return isDestruction
endFunction

bool function IsIllusionScroll(Scroll theScroll)
    bool isIllusion = true
    int magicEffectCount = theScroll.GetNumEffects()
    int i = 0
    while i < magicEffectCount && isIllusion
        MagicEffect theEffect = theScroll.GetNthEffectMagicEffect(i)
        string skillName = theEffect.GetAssociatedSkill()
        if skillName != "Illusion"
            isIllusion = false
        endIf
        i += 1
    endWhile
    return isIllusion
endFunction

bool function IsRestorationScroll(Scroll theScroll)
    bool isRestoration = true
    int magicEffectCount = theScroll.GetNumEffects()
    int i = 0
    while i < magicEffectCount && isRestoration
        MagicEffect theEffect = theScroll.GetNthEffectMagicEffect(i)
        string skillName = theEffect.GetAssociatedSkill()
        if skillName != "Restoration"
            isRestoration = false
        endIf
        i += 1
    endWhile
    return isRestoration
endFunction

bool function IsOneHandedWeapon(Weapon theWeapon)
    return theWeapon.GetSkill() == "OneHanded"
endFunction

bool function IsHeavyArmor(Armor theArmor)
    return theArmor.GetWeightClass() == 1
endFunction

bool function IsLightArmor(Armor theArmor)
    return theArmor.GetWeightClass() == 0
endFunction

bool function IsClothing(Armor theArmor)
    return theArmor.GetWeightClass() == 2
endFunction

bool function IsArmor(Armor theArmor)
    return ! IsClothing(theArmor)
endFunction
