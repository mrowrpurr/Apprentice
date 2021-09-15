Scriptname ApprenticePlayer extends ReferenceAlias  
{This is the Apprentice player script.}

; Note: For enchantments, we should only let you equip the item
;       if you are familiar with (aka trained in) the associated skill.

; Weapon training status
IsTrainedIn_OneHanded = true
IsTrainedIn_TwoHanded = false
IsTrainedIn_Marksman = false

; Armor training status
IsTrainedIn_HeavyArmor = true
IsTrainedIn_LightArmor = false

; Magic training status
IsTrainedIn_Restoration = true
IsTrainedIn_Alteration = false
IsTrainedIn_Destruction = false
IsTrainedIn_Conjuration = false
IsTrainedIn_Illusion = false
IsTrainedIn_Alchemy = false
IsTrainedIn_Enchanting = false

Armor MostRecentlyWornArmor

event OnObjectEquipped(Form object, ObjectReference instance)
    Debug.Trace("Player Equipped " + object.GetName())

    Weapon theWeapon = object as Weapon
    if theWeapon
        if ! IsOneHandedWeapon(theWeapon)
            string skillName = theWeapon.GetSkill()
            Debug.MessageBox(object.GetName() + " requires skill " + skillName)
            GetActorReference().UnequipItem(object)
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
