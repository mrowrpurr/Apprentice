Scriptname ApprenticePlayer extends ReferenceAlias  
{This is the Apprentice player script.}

; TODO: TRACK TRAININGS FOR EACH SKILL VIA Books -vs- Training -vs- Total.
; We can make it so you need to be trained by trainer BEFORE book, for example.

float function GetCurrentModVersion() global
    return 1.0
endFunction

float _currentlyInstalledModVersion

function Log(string text) global
    Debug.Trace("[Apprentice] " + text)
endFunction

; Options - THESE 3 ARE NOT YET USED
GlobalVariable property Apprentice_ModEnabled auto
GlobalVariable property Apprentice_Settings_DropOnEquip auto
GlobalVariable property Apprentice_Settings_NotificationOption auto ; (1) MessageBox, (2) Notification, (0) None
GlobalVariable property Apprentice_Settings_RestrictEnchantedItemUsage auto

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

bool IsInventoryMenuOpen = false
bool IsTrainingMenuOpen = false
bool IsBookMenuOpen = false

; Runs on initial mod installation
event OnInit()
    _currentlyInstalledModVersion = GetCurrentModVersion()
    ListenForEvents()
endEvent

; Runs on save game load
event OnPlayerLoadGame()
    ListenForEvents()
endEvent

; Listen for Skill Increase
; Also listen for Crafting Menu (which we automatically close if you're untrained)
; and the Inventory Menu (when you close it, we unequip items you tried to equip you're untrained in)
;                        (we don't do it immediately else it crashes SkyUI, fun times, fun times...)
function ListenForEvents()
    RegisterForMenu("Crafting Menu")
    RegisterForMenu("InventoryMenu")
    PO3_Events_Alias.RegisterForSkillIncrease(self)
endFunction

; Close the currently open crafting menu
function CloseCraftingMenu(int times = 2)
    ; Seems to require two invocations for me sometimes, so default to invoking the closing twice
    int i = 0
    while i < times
        UI.Invoke("Crafting Menu", "_global.CraftingMenu.CraftingMenuInstance.onExitButtonPress")
        i += 1
    endWhile
endFunction

; Gets the description text of the menu.
; This **REQUIRES** the tweaked `craftingmenu.swf` (which **REQUIRES** SkyUI)
string function GetOpenCraftingMenuName()
    return UI.GetString("Crafting Menu", "_global.CraftingMenu.CraftingMenuInstance.MenuDescription.text")
endFunction

; Simply presses 'Enter' to close out of the Alchemy menu which has its own Quit Menu dialog.
; To close the Alchemy menu, we tap it a few times to make sure it works.
function TapEnterKey(int times = 1, float waitTime = 0.1)
    int i = 0
    while i < times
        Input.TapKey(28) ; Enter Key
        if waitTime
            Utility.WaitMenuMode(waitTime)
        endIf
        i += 1
    endWhile
endFunction

; Watch for Crafting Menu to open. Close it if you're not trained in the appropriate skill (Alchemy, Enchanting, Smithing)
; Watch for Inventory Menu to open. SkyUI hates it if we unequip armor while it's open.
event OnMenuOpen(string menuName)
    if menuName == "InventoryMenu"
        IsInventoryMenuOpen = true
    elseIf menuName == "Book Menu"
        IsBookMenuOpen = true
    elseIf menuName == "Training Menu"
        IsTrainingMenuOpen = true
    elseIf menuName == "Crafting Menu"
        string description = GetOpenCraftingMenuName()
        if description
            Log("Opened Crafting Menu: " + description)
            if Apprentice_Training_Alchemy.GetValueInt() != 1 && StringUtil.Find(description, "Alchemy") > -1
                CloseCraftingMenu()
                TapEnterKey(times = 4)
                Debug.MessageBox("You need to train in Alchemy before you can use an Alchemy table")

            elseIf Apprentice_Training_Enchanting.GetValueInt() != 1 && StringUtil.Find(description, "Enchanting") > -1
                CloseCraftingMenu()
                Utility.WaitMenuMode(0.1)
                Debug.MessageBox("You need to train in Enchanting before you can use an Enchanting table")
                
            elseIf Apprentice_Training_Smithing.GetValueInt() == 0 && (StringUtil.Find(description, "Tanning Rack") > -1 || StringUtil.Find(description, "Blacksmith Forge") > -1 || StringUtil.Find(description, "Weapon Smithing") > -1 || StringUtil.Find(description, "Armor Smithing") > -1 || StringUtil.Find(description, "Smelter") > -1)
                CloseCraftingMenu()
                Utility.WaitMenuMode(0.1)
                Debug.MessageBox("You need to train in Smithing before you can use this")
            endIf
        else
            Log("Opened Crafting Menu: UNKNOWN. Couldn't detect name of crafting station, is our craftingmenu.swf overriden by another mod?")
        endIf
    endIf
endEvent

; Unequip the item that was marked to be unequipped when the menu closes.
event OnMenuClose(string menuName)
    if menuName == "InventoryMenu"
        IsInventoryMenuOpen = false
        UnequipAllItemsWhichShouldBeUnequipped()
    elseIf menuName == "Book Menu"
        IsBookMenuOpen = false
    elseIf menuName == "Training Menu"
        IsTrainingMenuOpen = false
    endIf
endEvent

; Mark the player as being trained once they learn a skill (increment the count so we know how many times they've been trained via trainer or book)
; e.g. from Training or from a Skill Book
event OnSkillIncrease(string skillName)
    Log("Skill Increased: " + skillName)
    if skillName == "OneHanded"
        Apprentice_Training_OneHanded.SetValueInt(1)
    elseIf skillName == "TwoHanded"
        Apprentice_Training_TwoHanded.SetValueInt(1)
    elseIf skillName  == "Marksman"
        Apprentice_Training_Marksman.SetValueInt(1)
    elseIf skillName == "HeavyArmor"
        Apprentice_Training_HeavyArmor.SetValueInt(1)
    elseIf skillName == "LightArmor"
        Apprentice_Training_LightArmor.SetValueInt(1)
    elseIf skillName == "Restoration"
        Apprentice_Training_Restoration.SetValueInt(1)
    elseIf skillName == "Alteration"
        Apprentice_Training_Alteration.SetValueInt(1)
    elseIf skillName == "Destruction"
        Apprentice_Training_Destruction.SetValueInt(1)
    elseIf skillName == "Conjuration"
        Apprentice_Training_Conjuration.SetValueInt(1)
    elseIf skillName == "Illusion"
        Apprentice_Training_Illusion.SetValueInt(1)
    elseIf skillName == "Alchemy"
        Apprentice_Training_Alchemy.SetValueInt(1)
    elseIf skillName == "Enchanting"
        Apprentice_Training_Enchanting.SetValueInt(1)
    elseIf skillName == "Smithing"
        Apprentice_Training_Smithing.SetValueInt(1)
    endIf
endEvent

; Tracks all items to unequip, see AddItemToUnequipOnMenuClose and UnequipAllItemsWhichShouldBeUnequipped
Form[] _itemsToUnequip

; If you try to equip an item which you cannot, this queues it up to be unequipped as soon as the Inventory menu closes.
; We only do this because, if you unequip immediately SkyUI has a lovely tendency to crash :)
function AddItemToUnequipOnMenuClose(Form item)
    if IsInventoryMenuOpen
        if _itemsToUnequip
            if _itemsToUnequip.Find(item) == -1 ; Not already in the array
                _itemsToUnequip = Utility.ResizeFormArray(_itemsToUnequip, _itemsToUnequip.Length + 1)
                _itemsToUnequip[_itemsToUnequip.Length - 1] = item
            endIf
        else
            _itemsToUnequip = new Form[1]
            _itemsToUnequip[0] = item
        endIf
    else
        ; If the inventory isn't open, just equip it right away
        GetActorReference().UnequipItem(item)
    endIf
endFunction

; See `AddItemToUnequipOnMenuClose`
function UnequipAllItemsWhichShouldBeUnequipped()
    if _itemsToUnequip
        int i = 0
        while i < _itemsToUnequip.Length
            Form theForm = _itemsToUnequip[i]
            GetActorReference().UnequipItem(theForm)
            i += 1
        endWhile
        _itemsToUnequip = Utility.CreateFormArray(0) ; Hack to keep Papyrus Log Warning from showing up (when you set it = None instead)
    endIf
endFunction

; Debug.MessageBox("You are not trained in Alteration magic.\n\nYou cannot equip " + enchantedItem.GetName() + " until you are trained in Alteration.")
function ShowEnchantingRequiredMessage(Form item, Enchantment theEnchantment)
    bool alterationMissing  = Apprentice_Training_Alteration.GetValueInt()  == 0 && EnchantmentRequiresMagicSkill(theEnchantment, "Alteration")
    bool conjurationMissing = Apprentice_Training_Conjuration.GetValueInt() == 0 && EnchantmentRequiresMagicSkill(theEnchantment, "Conjuration")
    bool destructionMissing = Apprentice_Training_Destruction.GetValueInt() == 0 && EnchantmentRequiresMagicSkill(theEnchantment, "Destruction")
    bool illusionMissing    = Apprentice_Training_Illusion.GetValueInt()    == 0 && EnchantmentRequiresMagicSkill(theEnchantment, "Illusion")
    bool restorationMissing = Apprentice_Training_Restoration.GetValueInt() == 0 && EnchantmentRequiresMagicSkill(theEnchantment, "Restoration")
    string magicSkills = ""
    if alterationMissing
        if magicSkills
            magicSkills += " and "
        endIf
        magicSkills += "Alteration"
    endIf
    if conjurationMissing
        if magicSkills
            magicSkills += " and "
        endIf
        magicSkills += "Conjuration"
    endIf
    if destructionMissing
        if magicSkills
            magicSkills += "and "
        endIf
        magicSkills += "Destruction"
    endIf
    if illusionMissing
        if magicSkills
            magicSkills += "and "
        endIf
        magicSkills += "Illusion"
    endIf
    if restorationMissing
        if magicSkills
            magicSkills += "and "
        endIf
        magicSkills += "Restoration"
    endIf
    string text = "You are not trained in " + magicSkills + "\n\nYou cannot use " + item.GetName() + " until you are trained in " + magicSkills + "."
    Debug.MessageBox(text)
endFunction

; Whenever the player equips an object, see if they are allowed to! If not, show a message and mark the item to be unequipped.
; Note: this is also used for Spells equipping via the magic menu (those spells are immediately unequipped)
event OnObjectEquipped(Form object, ObjectReference instance)
    Weapon theWeapon = object as Weapon
    Spell theSpell   = object as Spell
    Scroll theScroll = object as Scroll
    Armor theArmor   = object as Armor

    Enchantment theEnchantment
    Form enchantedItem
    if theArmor
        theEnchantment = theArmor.GetEnchantment()
        enchantedItem = theArmor
    elseIf theWeapon
        theEnchantment = theWeapon.GetEnchantment()
        enchantedItem = theWeapon
    endIf

    ; Check for enchantment first
    if theEnchantment && Apprentice_Settings_RestrictEnchantedItemUsage.GetValueInt() == 1
        if EnchantmentRequiresMagicSkill(theEnchantment, "Alteration") && Apprentice_Training_Alteration.GetValueInt() == 0
            ShowEnchantingRequiredMessage(enchantedItem, theEnchantment)
            AddItemToUnequipOnMenuClose(enchantedItem)
            return
        elseIf EnchantmentRequiresMagicSkill(theEnchantment, "Conjuration") && Apprentice_Training_Conjuration.GetValueInt() == 0
            ShowEnchantingRequiredMessage(enchantedItem, theEnchantment)
            AddItemToUnequipOnMenuClose(enchantedItem)
            return
        elseIf EnchantmentRequiresMagicSkill(theEnchantment, "Destruction") && Apprentice_Training_Destruction.GetValueInt() == 0
            ShowEnchantingRequiredMessage(enchantedItem, theEnchantment)
            AddItemToUnequipOnMenuClose(enchantedItem)
            return
        elseIf EnchantmentRequiresMagicSkill(theEnchantment, "Illusion") && Apprentice_Training_Illusion.GetValueInt() == 0
            ShowEnchantingRequiredMessage(enchantedItem, theEnchantment)
            AddItemToUnequipOnMenuClose(enchantedItem)
            return
        elseIf EnchantmentRequiresMagicSkill(theEnchantment, "Restoration") && Apprentice_Training_Restoration.GetValueInt() == 0
            ShowEnchantingRequiredMessage(enchantedItem, theEnchantment)
            AddItemToUnequipOnMenuClose(enchantedItem)
            return
        endIf
    endIf

    if theWeapon
        string skillName = theWeapon.GetSkill()
        if skillName == "OneHanded" && Apprentice_Training_OneHanded.GetValueInt() == 0
            Debug.MessageBox("You are not trained in One-Handed weapons.\n\nYou cannot equip " + theWeapon.GetName() + " until you are trained in One-Handed weapons.")
            AddItemToUnequipOnMenuClose(theWeapon)
        elseIf skillName == "TwoHanded" && Apprentice_Training_TwoHanded.GetValueInt() == 0
            Debug.MessageBox("You are not trained in Two-Handed weapons.\n\nYou cannot equip " + theWeapon.GetName() + " until you are trained in Two-Handed weapon.")
            AddItemToUnequipOnMenuClose(theWeapon)
        elseIf skillName == "Marksman" && Apprentice_Training_Marksman.GetValueInt() == 0
            Debug.MessageBox("You are not trained in Archery.\n\nYou cannot equip " + theWeapon.GetName() + " until you are trained in Archery weapon.")
            AddItemToUnequipOnMenuClose(theWeapon)
        endIf
    elseIf theSpell
        if IsAlterationSpell(theSpell) && Apprentice_Training_Alteration.GetValueInt() == 0
            Debug.MessageBox("You are not trained in Alteration spells.\n\nYou cannot cast " + theSpell.GetName() + " until you are trained in Alteration.")
            GetActorReference().UnequipSpell(theSpell, 0)
            GetActorReference().UnequipSpell(theSpell, 1)
        elseIf IsConjurationSpell(theSpell) && Apprentice_Training_Conjuration.GetValueInt() == 0
            Debug.MessageBox("You are not trained in Conjuration spells.\n\nYou cannot cast " + theSpell.GetName() + " until you are trained in Conjuration.")
            GetActorReference().UnequipSpell(theSpell, 0)
            GetActorReference().UnequipSpell(theSpell, 1)
        elseIf IsDestructionSpell(theSpell) && Apprentice_Training_Destruction.GetValueInt() == 0
            Debug.MessageBox("You are not trained in Destruction spells.\n\nYou cannot cast " + theSpell.GetName() + " until you are trained in Destruction.")
            GetActorReference().UnequipSpell(theSpell, 0)
            GetActorReference().UnequipSpell(theSpell, 1)
        elseIf IsIllusionSpell(theSpell) && Apprentice_Training_Illusion.GetValueInt() == 0
            Debug.MessageBox("You are not trained in Illusion spells.\n\nYou cannot cast " + theSpell.GetName() + " until you are trained in Illusion.")
            GetActorReference().UnequipSpell(theSpell, 0)
            GetActorReference().UnequipSpell(theSpell, 1)
        elseIf IsRestorationSpell(theSpell) && Apprentice_Training_Restoration.GetValueInt() == 0
            Debug.MessageBox("You are not trained in Restoration spells.\n\nYou cannot cast " + theSpell.GetName() + " until you are trained in Restoration.")
            GetActorReference().UnequipSpell(theSpell, 0)
            GetActorReference().UnequipSpell(theSpell, 1)
        endIf
    elseIf theScroll
        if IsAlterationScroll(theScroll) && Apprentice_Training_Alteration.GetValueInt() == 0
            Debug.MessageBox("You are not trained in Alteration spells.\n\nYou cannot use " + theScroll.GetName() + " until you are trained in Alteration.")
            AddItemToUnequipOnMenuClose(theScroll)
        elseIf IsConjurationScroll(theScroll) && Apprentice_Training_Conjuration.GetValueInt() == 0
            Debug.MessageBox("You are not trained in Conjuration spells.\n\nYou cannot use " + theScroll.GetName() + " until you are trained in Conjuration.")
            AddItemToUnequipOnMenuClose(theScroll)
        elseIf IsDestructionScroll(theScroll) && Apprentice_Training_Destruction.GetValueInt() == 0
            Debug.MessageBox("You are not trained in Destruction spells.\n\nYou cannot use " + theScroll.GetName() + " until you are trained in Destruction.")
            AddItemToUnequipOnMenuClose(theScroll)
        elseIf IsIllusionScroll(theScroll) && Apprentice_Training_Illusion.GetValueInt() == 0
            Debug.MessageBox("You are not trained in Illusion spells.\n\nYou cannot use " + theScroll.GetName() + " until you are trained in Illusion.")
            AddItemToUnequipOnMenuClose(theScroll)
        elseIf IsRestorationScroll(theScroll) && Apprentice_Training_Restoration.GetValueInt() == 0
            Debug.MessageBox("You are not trained in Restoration spells.\n\nYou cannot use " + theScroll.GetName() + " until you are trained in Restoration.")
            AddItemToUnequipOnMenuClose(theScroll)
        endIf
    elseIf theArmor && IsArmor(theArmor)
        if theArmor.IsShield() && Apprentice_Training_Block.GetValueInt() == 0
            Debug.MessageBox("You are not trained in Block.\n\nYou cannot equip " + theArmor.GetName() + " until you are trained in Block.")
            AddItemToUnequipOnMenuClose(theArmor)
        else
            if IsHeavyArmor(theArmor) && Apprentice_Training_HeavyArmor.GetValueInt() == 0
                Debug.MessageBox("You are not trained in Heavy Armor.\n\nYou cannot equip " + theArmor.GetName() + " until you are trained in Heavy Armor.")
                AddItemToUnequipOnMenuClose(theArmor)
                ;;; GetActorReference().EquipItem(MostRecentlyWornArmor) ; TODO - let's try to re-equip whatever they were wearing in these slots
            elseIf IsLightArmor(theArmor) && Apprentice_Training_LightArmor.GetValueInt() == 0
                Debug.MessageBox("You are not trained in Light Armor.\n\nYou cannot equip " + theArmor.GetName() + " until you are trained in Light Armor.")
                AddItemToUnequipOnMenuClose(theArmor)
                ;;; GetActorReference().EquipItem(MostRecentlyWornArmor) ; TODO - let's try to re-equip whatever they were wearing in these slots
            endIf
        endIf
    endIf
endEvent

; Note: you might thing that Fortify Archery would be the "Archery" skill but I believe it's Restoration (we will test) 
bool function EnchantmentRequiresMagicSkill(Enchantment theEnchantment, string skillName)
    int magicEffectCount = theEnchantment.GetNumEffects()
    int i = 0
    while i < magicEffectCount
        MagicEffect theEffect = theEnchantment.GetNthEffectMagicEffect(i)
        if theEffect.GetAssociatedSkill() == skillName
            return true
        endIf
        i += 1
    endWhile
    return false
endFunction

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
