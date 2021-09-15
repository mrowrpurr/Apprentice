Scriptname ApprenticePlayer extends ReferenceAlias  
{This is the Apprentice player script.}

; Note: For enchantments, we should only let you equip the item
;       if you are familiar with (aka trained in) the associated skill.

; Skill Books - require a few to unlock skill!

; ; Weapon books read
; int IsTrainedIn_OneHanded
; int IsTrainedIn_TwoHanded
; int IsTrainedIn_Marksman

; ; Armor books read
; int IsTrainedIn_HeavyArmor
; int IsTrainedIn_LightArmor

; ; Magic books read
; int IsTrainedIn_Restoration
; int IsTrainedIn_Alteration
; int IsTrainedIn_Destruction
; int IsTrainedIn_Conjuration
; int IsTrainedIn_Illusion
; int IsTrainedIn_Alchemy
; int IsTrainedIn_Enchanting

; Weapon training status
bool IsTrainedIn_OneHanded = true
bool IsTrainedIn_TwoHanded = false
bool IsTrainedIn_Marksman = false

; Armor training status
bool IsTrainedIn_HeavyArmor = true
bool IsTrainedIn_LightArmor = false

; Magic training status
bool IsTrainedIn_Restoration = true
bool IsTrainedIn_Alteration = false
bool IsTrainedIn_Destruction = false
bool IsTrainedIn_Conjuration = false
bool IsTrainedIn_Illusion = false
bool IsTrainedIn_Alchemy = false
bool IsTrainedIn_Enchanting = false

; Weapon current skill level
float CurrentSkillLevel_OneHanded
float CurrentSkillLevel_TwoHanded
float CurrentSkillLevel_Marksman

; Armor current skill level
float CurrentSkillLevel_HeavyArmor
float CurrentSkillLevel_LightArmor

; Magic current skill level
float CurrentSkillLevel_Restoration
float CurrentSkillLevel_Alteration
float CurrentSkillLevel_Destruction
float CurrentSkillLevel_Conjuration
float CurrentSkillLevel_Illusion
float CurrentSkillLevel_Alchemy
float CurrentSkillLevel_Enchanting

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

    ; RegisterForMenu("Training Menu")
    PO3_Events_Alias.RegisterForSkillIncrease(self)
endFunction

event OnMenuOpen(string menuName)
    string description = UI.GetString("Crafting Menu", "_global.CraftingMenu.CraftingMenuInstance.MenuDescription.text")
    if ! IsTrainedIn_Alchemy && StringUtil.Find(description, "Alchemy") > -1
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
    elseIf ! IsTrainedIn_Enchanting && StringUtil.Find(description, "Enchanting") > -1
        UI.Invoke("Crafting Menu", "_global.CraftingMenu.CraftingMenuInstance.onExitButtonPress")
        UI.Invoke("Crafting Menu", "_global.CraftingMenu.CraftingMenuInstance.onExitButtonPress")
        Utility.WaitMenuMode(0.1)
        Debug.MessageBox("You need to train in Enchanting before you can use an Enchanting table")
    endIf
endEvent

event OnSkillIncrease(string trainedSkill)
    if trainedSkill == "OneHanded"
        IsTrainedIn_OneHanded = true
    elseIf trainedSkill == "TwoHanded"
        IsTrainedIn_TwoHanded = true
    elseIf trainedSkill  == "Marksman"
        IsTrainedIn_Marksman = true
    elseIf trainedSkill == "HeavyArmor"
        IsTrainedIn_HeavyArmor = true
    elseIf trainedSkill == "LightArmor"
        IsTrainedIn_LightArmor = true
    elseIf trainedSkill == "Restoration"
        IsTrainedIn_Restoration = true
    elseIf trainedSkill == "Alteration"
        IsTrainedIn_Alchemy = true
    elseIf trainedSkill == "Destruction"
        IsTrainedIn_Destruction = true
    elseIf trainedSkill == "Conjuration"
        IsTrainedIn_Conjuration = true
    elseIf trainedSkill == "Illusion"
        IsTrainedIn_Illusion = true
    elseIf trainedSkill == "Alchemy"
        IsTrainedIn_Alchemy = true
    elseIf trainedSkill == "Enchanting"
        IsTrainedIn_Enchanting = true
    endIf
endEvent

event OnObjectEquipped(Form object, ObjectReference instance)
    Actor player = GetActorReference()
    Debug.Trace("Player Equipped " + object.GetName())

    Weapon theWeapon = object as Weapon
    if theWeapon
        string skillName = theWeapon.GetSkill()
        if skillName == "OneHanded" && ! IsTrainedIn_OneHanded
            Debug.MessageBox("You are not trained in One-Handed weapons")
            player.UnequipItem(theWeapon)
        elseIf skillName == "TwoHanded" && ! IsTrainedIn_TwoHanded
            Debug.MessageBox("You are not trained in Two-Handed weapons")
            player.UnequipItem(theWeapon)
        elseIf skillName == "Marksman" && ! IsTrainedIn_Marksman
            Debug.MessageBox("You are not trained in Archery")
            player.UnequipItem(theWeapon)
        endIf
    endIf

    Spell theSpell = object as Spell
    if theSpell
        if ! IsRestorationSpell(theSpell)
            Debug.Notification("You only know how to cast Restoration spells")
            GetActorReference().UnequipSpell(theSpell, 0)
            GetActorReference().UnequipSpell(theSpell, 1)
        endIf
    endIf

    Armor theArmor = object as Armor
    if theArmor
        if IsArmor(theArmor) && ! IsHeavyArmor(theArmor)
            Debug.MessageBox(theArmor.GetName() + " is not heavy armor, we only know how to use heavy armor")
            GetActorReference().UnequipItem(theArmor)
            GetActorReference().EquipItem(MostRecentlyWornArmor)
        else
            ; Track it
            MostRecentlyWornArmor = theArmor
        endIf
    endIf
endEvent

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

bool function IsOneHandedWeapon(Weapon theWeapon)
    return theWeapon.GetSkill() == "OneHanded"
endFunction

bool function IsHeavyArmor(Armor theArmor)
    return theArmor.GetWeightClass() == 1
endFunction

bool function IsClothing(Armor theArmor)
    return theArmor.GetWeightClass() == 2
endFunction

bool function IsArmor(Armor theArmor)
    return ! IsClothing(theArmor)
endFunction

function RecordCurrentSkills()
    Actor player = GetActorReference()

    ; Weapon current skill level
    CurrentSkillLevel_OneHanded = player.GetActorValue("OneHanded")
    CurrentSkillLevel_TwoHanded = player.GetActorValue("TwoHanded")
    CurrentSkillLevel_Marksman  = player.GetActorValue("Marksman")

    ; Armor current skill level
    CurrentSkillLevel_HeavyArmor = player.GetActorValue("HeavyArmor")
    CurrentSkillLevel_LightArmor = player.GetActorValue("LightArmor")

    ; Magic current skill level
    CurrentSkillLevel_Restoration = player.GetActorValue("Restoration")
    CurrentSkillLevel_Alteration = player.GetActorValue("Alteration")
    CurrentSkillLevel_Destruction = player.GetActorValue("Destruction")
    CurrentSkillLevel_Conjuration = player.GetActorValue("Conjuration")
    CurrentSkillLevel_Illusion = player.GetActorValue("Illusion")
    CurrentSkillLevel_Alchemy = player.GetActorValue("Alchemy")
    CurrentSkillLevel_Enchanting = player.GetActorValue("Enchanting")
endFunction

string function GetWhichSkillWasTrained()
    Actor player = GetActorReference()
    if CurrentSkillLevel_OneHanded != player.GetActorValue("OneHanded")
        return "OneHanded"
    elseIf CurrentSkillLevel_TwoHanded != player.GetActorValue("TwoHanded")
        return "TwoHanded"
    elseIf CurrentSkillLevel_Marksman  != player.GetActorValue("Marksman")
        return "Marksman"
    elseIf CurrentSkillLevel_HeavyArmor != player.GetActorValue("HeavyArmor")
        return "HeavyArmor"
    elseIf CurrentSkillLevel_LightArmor != player.GetActorValue("LightArmor")
        return "LightArmor"
    elseIf CurrentSkillLevel_Restoration != player.GetActorValue("Restoration")
        return "Restoration"
    elseIf CurrentSkillLevel_Alteration != player.GetActorValue("Alteration")
        return "Alteration"
    elseIf CurrentSkillLevel_Destruction != player.GetActorValue("Destruction")
        return "Destruction"
    elseIf CurrentSkillLevel_Conjuration != player.GetActorValue("Conjuration")
        return "Conjuration"
    elseIf CurrentSkillLevel_Illusion != player.GetActorValue("Illusion")
        return "Illusion"
    elseIf CurrentSkillLevel_Alchemy != player.GetActorValue("Alchemy")
        return "Alchemy"
    elseIf CurrentSkillLevel_Enchanting != player.GetActorValue("Enchanting")
        return "Enchanting"
    endIf
endFunction
