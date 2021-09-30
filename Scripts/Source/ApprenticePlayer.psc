Scriptname ApprenticePlayer extends ReferenceAlias  
{This is the Apprentice player script.}

; TODO - Make sure the ABILITIES for UNTRAINED SKILLS
;        are all added EVEN FOR FOLKS WHO ALREADY HAVE THE MOD INSTALLED

; TODO - Update how we detect the spell school of magic.
;        Use Spell.GetPerk()!

; TODO: TRACK TRAININGS FOR EACH SKILL VIA Books -vs- Training -vs- Total.
; We can make it so you need to be trained by trainer BEFORE book, for example.

float function GetCurrentModVersion() global
    return 1.0
endFunction

float _currentlyInstalledModVersion

function Log(string text) global
    Debug.Trace("[Apprentice] " + text)
endFunction

; Perk with the Crafting Table and Lockpicking and other restrictions
Perk property Apprentice_Restrictions_Perk auto

; Options - THESE 3 ARE NOT YET USED
GlobalVariable property Apprentice_ModEnabled auto
GlobalVariable property Apprentice_Settings_TrainFromBooks auto
GlobalVariable property Apprentice_Settings_NotificationOption auto ; (1) MessageBox, (2) Notification, (0) None
GlobalVariable property Apprentice_Settings_RestrictEnchantedItemUsage auto

; Training Tracking
;
; 0 - Untrained
; 1 - Trained 25
; 2 - Trained 50
; 3 - Trained 75

; Armor
GlobalVariable property Apprentice_Training_HeavyArmor auto
GlobalVariable property Apprentice_Training_LightArmor auto

; Weapons
Keyword property WeapTypeDagger auto
GlobalVariable property Apprentice_Training_Daggers auto
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

; Lockpicking & Pickpocket
GlobalVariable property Apprentice_Training_Lockpicking auto
GlobalVariable property Apprentice_Training_Pickpocket auto

; Track Spells and Items on Allowlists
Form[] property AllowedSpells auto
Form[] property AllowedItems  auto
string[] property AllowedNames auto

; For testing
bool property SaveShownMessages auto
string[] property ShownMessages auto

bool IsInventoryMenuOpen = false
bool IsTrainingMenuOpen = false
bool IsBookMenuOpen = false
bool IsCraftingMenuOpen = false

; Get the running instance of the ApprenticePlayer script from the main Apprentice quest
ApprenticePlayer function GetInstance() global
    return (Game.GetFormFromFile(0xd62, "Apprentice.esp") as Quest).GetAliasByName("PlayerRef") as ApprenticePlayer
endFunction

; Show a message to the Player
; The MCM can configure this to be a Debug.MessageBox, a Debug.Notification, or no message.
function ShowMessage(string text) global
    int notificationOption = ApprenticePlayer.GetInstance().Apprentice_Settings_NotificationOption.GetValueInt()
    if notificationOption == 1 ; MessageBox
        Debug.MessageBox(text)
    elseIf notificationOption == 2 ; Notification
        Debug.Notification(text)
    endIf
    ApprenticePlayer instance = GetInstance()
    if instance.SaveShownMessages
        if instance.ShownMessages
            instance.ShownMessages = Utility.ResizeStringArray(instance.ShownMessages, instance.ShownMessages.Length + 1)
            instance.ShownMessages[instance.ShownMessages.Length - 1] = text
        else
            instance.ShownMessages = new string[1]
            instance.ShownMessages[0] = text
        endIf
    endIf
endFunction

; Clear messages used for testing (saves messages sent to ShowMessage())
function ClearShownMessages()
    ShownMessages = new string[1] ; Reset
endFunction

; Resets all of the globals for whether you're trained in skills or not (used mostly by tests)
function ResetAllTrainingStatus()
    Apprentice_Training_HeavyArmor.SetValueInt(0)
    Apprentice_Training_LightArmor.SetValueInt(0)
    Apprentice_Training_Daggers.SetValueInt(0)
    Apprentice_Training_OneHanded.SetValueInt(0)
    Apprentice_Training_TwoHanded.SetValueInt(0)
    Apprentice_Training_Marksman.SetValueInt(0)
    Apprentice_Training_Alchemy.SetValueInt(0)
    Apprentice_Training_Enchanting.SetValueInt(0)
    Apprentice_Training_Alteration.SetValueInt(0)
    Apprentice_Training_Conjuration.SetValueInt(0)
    Apprentice_Training_Illusion.SetValueInt(0)
    Apprentice_Training_Restoration.SetValueInt(0)
    Apprentice_Training_Destruction.SetValueInt(0)
    Apprentice_Training_Smithing.SetValueInt(0)
    Apprentice_Training_Block.SetValueInt(0)
    Apprentice_Training_Lockpicking.SetValueInt(0)
    Apprentice_Training_Pickpocket.SetValueInt(0)
endFunction

; Runs on initial mod installation
event OnInit()
    GetActorReference().AddPerk(Apprentice_Restrictions_Perk)
    _currentlyInstalledModVersion = GetCurrentModVersion()
    ListenForEvents()
    UI.SetFloat("HUD Menu", "_root.HUDMovieBaseInstance.StealthMeterInstance._alpha", 0.0)
endEvent

; Runs on save game load
event OnPlayerLoadGame()
    Actor player = GetActorReference()
    if ! player.HasPerk(Apprentice_Restrictions_Perk)
        player.AddPerk(Apprentice_Restrictions_Perk)
    endIf
    ListenForEvents()
endEvent

; Listen for Skill Increase
; Also listen for Crafting Menu (which we automatically close if you're untrained)
; and the Inventory Menu (when you close it, we unequip items you tried to equip you're untrained in)
;                        (we don't do it immediately else it crashes SkyUI, fun times, fun times...)
function ListenForEvents()
    RegisterForMenu("InventoryMenu")
    RegisterForMenu("Book Menu")
    RegisterForMenu("Training Menu")
    RegisterForMenu("Crafting Menu")
    PO3_Events_Alias.RegisterForSkillIncrease(self)
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
        IsCraftingMenuOpen = true
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
    elseIf menuName == "Crafting Menu"
        IsCraftingMenuOpen = false
    endIf
endEvent

function SetSkillTrained(string skillName)
    if ! IsSkillTrained(skillName)
        Debug.Notification("You are now trained in " + skillName)
    endIf
    GetVariableForSkill(skillName).SetValueInt(1)
endFunction

function SetSkillUntrained(string skillName)
    GetVariableForSkill(skillName).SetValueInt(0)
endFunction

bool function IsSkillTrained(string skillName)
    return GetVariableForSkill(skillName).GetValueInt() == 1
endFunction

GlobalVariable function GetVariableForSkill(string skillName)
    if skillName == "OneHanded"
        return Apprentice_Training_OneHanded
    elseIf skillName == "TwoHanded"
        return Apprentice_Training_TwoHanded
    elseIf skillName  == "Marksman"
        return Apprentice_Training_Marksman
    elseIf skillName == "HeavyArmor"
        return Apprentice_Training_HeavyArmor
    elseIf skillName == "LightArmor"
        return Apprentice_Training_LightArmor
    elseIf skillName == "Restoration"
        return Apprentice_Training_Restoration
    elseIf skillName == "Alteration"
        return Apprentice_Training_Alteration
    elseIf skillName == "Destruction"
        return Apprentice_Training_Destruction
    elseIf skillName == "Conjuration"
        return Apprentice_Training_Conjuration
    elseIf skillName == "Illusion"
        return Apprentice_Training_Illusion
    elseIf skillName == "Alchemy"
        return Apprentice_Training_Alchemy
    elseIf skillName == "Enchanting"
        return Apprentice_Training_Enchanting
    elseIf skillName == "Smithing"
        return Apprentice_Training_Smithing
    elseIf skillName == "Lockpicking"
        return Apprentice_Training_Lockpicking
    elseIf skillName == "Pickpocket"
        return Apprentice_Training_Pickpocket
    endIf
endFunction

; Mark the player as being trained once they learn a skill (increment the count so we know how many times they've been trained via trainer or book)
; e.g. from Training or from a Skill Book
event OnSkillIncrease(string skillName)
    if Apprentice_Settings_TrainFromBooks.GetValueInt() == 0
        return
    endIf

    if skillName == "OneHanded"
        SetSkillTrained("OneHanded")
    elseIf skillName == "TwoHanded"
        SetSkillTrained("TwoHanded")
    elseIf skillName  == "Marksman"
        SetSkillTrained("Marksman")
    elseIf skillName == "HeavyArmor"
        SetSkillTrained("HeavyArmor")
    elseIf skillName == "LightArmor"
        SetSkillTrained("LightArmor")
    elseIf skillName == "Restoration"
        SetSkillTrained("Restoration")
    elseIf skillName == "Alteration"
        SetSkillTrained("Alteration")
    elseIf skillName == "Destruction"
        SetSkillTrained("Destruction")
    elseIf skillName == "Conjuration"
        SetSkillTrained("Conjuration")
    elseIf skillName == "Illusion"
        SetSkillTrained("Illusion")
    elseIf skillName == "Alchemy"
        SetSkillTrained("Alchemy")
    elseIf skillName == "Enchanting"
        SetSkillTrained("Enchanting")
    elseIf skillName == "Smithing"
        SetSkillTrained("Smithing")
    elseIf skillName == "Lockpicking"
        SetSkillTrained("Lockpicking")
    elseIf skillName == "Pickpocket"
        SetSkillTrained("Pickpocket")
    endIf
endEvent

; Tracks all items to unequip, see AddItemToUnequipOnMenuClose and UnequipAllItemsWhichShouldBeUnequipped
Form[] _itemsToUnequip

; TODO - UNEQUIP ALL IMMEDIATELY EXPECT ... ARMOR? Whichever one CTDs
;
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

function AddAllowedFilter(string text)
    if AllowedNames
        AllowedNames = Utility.ResizeStringArray(AllowedNames, AllowedNames.Length + 1)
        AllowedNames[AllowedNames.Length - 1] = text
    else
        AllowedNames = new string[1]
        AllowedNames[0] = text
    endIf
endFunction

function AddAllowedItem(Form item)
    if AllowedItems
        AllowedItems = Utility.ResizeFormArray(AllowedItems, AllowedItems.Length + 1)
        AllowedItems[AllowedItems.Length - 1] = item
    else
        AllowedItems = new Form[1]
        AllowedItems[0] = item
    endIf
endFunction

function AddAllowedSpell(Form theSpell)
    if AllowedSpells
        AllowedSpells = Utility.ResizeFormArray(AllowedSpells, AllowedSpells.Length + 1)
        AllowedSpells[AllowedSpells.Length - 1] = theSpell
    else
        AllowedSpells = new Form[1]
        AllowedSpells[0] = theSpell
    endIf
endFunction

; ApprenticePlayer.ShowMessage("You are not trained in Alteration magic.\n\nYou cannot equip " + enchantedItem.GetName() + " until you are trained in Alteration.")
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
    ApprenticePlayer.ShowMessage(text)
endFunction

Scroll lastSelectedScroll
float lastSelectedScrollAt

bool function IsAllowedItemName(string name)
    if AllowedNames
        int i = 0
        while i < AllowedNames.Length
            if StringUtil.Find(name, AllowedNames[i]) > -1
                return true
            endIf
            i += 1
        endWhile
        return false
    else
        return false
    endIf
endFunction

event OnItemAdded(Form item, int count, ObjectReference akItemReference, ObjectReference akSourceContainer)
    if IsCraftingMenuOpen
        if Utility.RandomInt(1, 100) < 20
            Debug.MessageBox("Nice crafting, dumbass! You fucked up.\n\n" + item.GetName() + " was destroyed in the process!")
            GetActorReference().RemoveItem(item, count)
            ; Debug.MessageBox("Whoops! You crafted " + item.GetName() + " incorrectly! It was destroyed in the process.")
        endIf
    endIf
endEvent

; Whenever the player equips an object, see if they are allowed to! If not, show a message and mark the item to be unequipped.
; Note: this is also used for Spells equipping via the magic menu (those spells are immediately unequipped)
event OnObjectEquipped(Form object, ObjectReference instance)
    return ; While Testing...

    if AllowedItems.Find(object) > -1 || AllowedSpells.Find(object) > -1 || IsAllowedItemName(object.GetName())
        return
    endIf

    Weapon theWeapon = object as Weapon
    Spell theSpell   = object as Spell
    Scroll theScroll = object as Scroll
    Armor theArmor   = object as Armor

    ; If within the past second this scroll was selected, ignore. SkyUI issue.
    if theScroll && lastSelectedScroll && lastSelectedScroll == theScroll && (Utility.GetCurrentRealTime() - lastSelectedScrollAt) < 1
        return
    endIf

    lastSelectedScroll = theScroll
    lastSelectedScrollAt = Utility.GetCurrentRealTime()

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
            if theWeapon.HasKeyword(WeapTypeDagger) && Apprentice_Training_Daggers.GetValueInt() != 0
                ; Trained in Daggers and this is a dagger
                ; So do nothing
            else
                ApprenticePlayer.ShowMessage("You are not trained in One-Handed weapons.\n\nYou cannot equip " + theWeapon.GetName() + " until you are trained in One-Handed weapons.")
                AddItemToUnequipOnMenuClose(theWeapon)
                ; GetActorReference().UnequipItem(theWeapon)
            endIf            
        elseIf skillName == "TwoHanded" && Apprentice_Training_TwoHanded.GetValueInt() == 0
            ApprenticePlayer.ShowMessage("You are not trained in Two-Handed weapons.\n\nYou cannot equip " + theWeapon.GetName() + " until you are trained in Two-Handed weapon.")
            AddItemToUnequipOnMenuClose(theWeapon)
        elseIf skillName == "Marksman" && Apprentice_Training_Marksman.GetValueInt() == 0
            ApprenticePlayer.ShowMessage("You are not trained in Archery.\n\nYou cannot equip " + theWeapon.GetName() + " until you are trained in Archery.")
            AddItemToUnequipOnMenuClose(theWeapon)
        endIf
    elseIf theSpell
        if IsAlterationSpell(theSpell) && Apprentice_Training_Alteration.GetValueInt() == 0
            ApprenticePlayer.ShowMessage("You are not trained in Alteration spells.\n\nYou cannot cast " + theSpell.GetName() + " until you are trained in Alteration.")
            GetActorReference().UnequipSpell(theSpell, 0)
            GetActorReference().UnequipSpell(theSpell, 1)
        elseIf IsConjurationSpell(theSpell) && Apprentice_Training_Conjuration.GetValueInt() == 0
            ApprenticePlayer.ShowMessage("You are not trained in Conjuration spells.\n\nYou cannot cast " + theSpell.GetName() + " until you are trained in Conjuration.")
            GetActorReference().UnequipSpell(theSpell, 0)
            GetActorReference().UnequipSpell(theSpell, 1)
        elseIf IsDestructionSpell(theSpell) && Apprentice_Training_Destruction.GetValueInt() == 0
            ApprenticePlayer.ShowMessage("You are not trained in Destruction spells.\n\nYou cannot cast " + theSpell.GetName() + " until you are trained in Destruction.")
            GetActorReference().UnequipSpell(theSpell, 0)
            GetActorReference().UnequipSpell(theSpell, 1)
        elseIf IsIllusionSpell(theSpell) && Apprentice_Training_Illusion.GetValueInt() == 0
            ApprenticePlayer.ShowMessage("You are not trained in Illusion spells.\n\nYou cannot cast " + theSpell.GetName() + " until you are trained in Illusion.")
            GetActorReference().UnequipSpell(theSpell, 0)
            GetActorReference().UnequipSpell(theSpell, 1)
        elseIf IsRestorationSpell(theSpell) && Apprentice_Training_Restoration.GetValueInt() == 0
            ApprenticePlayer.ShowMessage("You are not trained in Restoration spells.\n\nYou cannot cast " + theSpell.GetName() + " until you are trained in Restoration.")
            GetActorReference().UnequipSpell(theSpell, 0)
            GetActorReference().UnequipSpell(theSpell, 1)
        endIf
    elseIf theScroll
        if IsAlterationScroll(theScroll) && Apprentice_Training_Alteration.GetValueInt() == 0
            ApprenticePlayer.ShowMessage("You are not trained in Alteration spells.\n\nYou cannot use " + theScroll.GetName() + " until you are trained in Alteration.")
            AddItemToUnequipOnMenuClose(theScroll)
        elseIf IsConjurationScroll(theScroll) && Apprentice_Training_Conjuration.GetValueInt() == 0
            ApprenticePlayer.ShowMessage("You are not trained in Conjuration spells.\n\nYou cannot use " + theScroll.GetName() + " until you are trained in Conjuration.")
            AddItemToUnequipOnMenuClose(theScroll)
        elseIf IsDestructionScroll(theScroll) && Apprentice_Training_Destruction.GetValueInt() == 0
            ApprenticePlayer.ShowMessage("You are not trained in Destruction spells.\n\nYou cannot use " + theScroll.GetName() + " until you are trained in Destruction.")
            AddItemToUnequipOnMenuClose(theScroll)
        elseIf IsIllusionScroll(theScroll) && Apprentice_Training_Illusion.GetValueInt() == 0
            ApprenticePlayer.ShowMessage("You are not trained in Illusion spells.\n\nYou cannot use " + theScroll.GetName() + " until you are trained in Illusion.")
            AddItemToUnequipOnMenuClose(theScroll)
        elseIf IsRestorationScroll(theScroll) && Apprentice_Training_Restoration.GetValueInt() == 0
            ApprenticePlayer.ShowMessage("You are not trained in Restoration spells.\n\nYou cannot use " + theScroll.GetName() + " until you are trained in Restoration.")
            AddItemToUnequipOnMenuClose(theScroll)
        endIf
    elseIf theArmor && IsArmor(theArmor)
        if theArmor.IsShield() && Apprentice_Training_Block.GetValueInt() == 0
            ApprenticePlayer.ShowMessage("You are not trained in Block.\n\nYou cannot equip " + theArmor.GetName() + " until you are trained in Block.")
            AddItemToUnequipOnMenuClose(theArmor)
        else
            if IsHeavyArmor(theArmor) && Apprentice_Training_HeavyArmor.GetValueInt() == 0
                ApprenticePlayer.ShowMessage("You are not trained in Heavy Armor.\n\nYou cannot equip " + theArmor.GetName() + " until you are trained in Heavy Armor.")
                AddItemToUnequipOnMenuClose(theArmor)
                ;;; GetActorReference().EquipItem(MostRecentlyWornArmor) ; TODO - let's try to re-equip whatever they were wearing in these slots
            elseIf IsLightArmor(theArmor) && Apprentice_Training_LightArmor.GetValueInt() == 0
                ApprenticePlayer.ShowMessage("You are not trained in Light Armor.\n\nYou cannot equip " + theArmor.GetName() + " until you are trained in Light Armor.")
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
    return theSpell.GetMagicEffects()[0].GetAssociatedSkill() == "Alteration"
endFunction

bool function IsConjurationSpell(Spell theSpell)
    return theSpell.GetMagicEffects()[0].GetAssociatedSkill() == "Conjuration"
endFunction

bool function IsDestructionSpell(Spell theSpell)
    return theSpell.GetMagicEffects()[0].GetAssociatedSkill() == "Destruction"
endFunction

bool function IsIllusionSpell(Spell theSpell)
    return theSpell.GetMagicEffects()[0].GetAssociatedSkill() == "Illusion"
endFunction

bool function IsRestorationSpell(Spell theSpell)
    return theSpell.GetMagicEffects()[0].GetAssociatedSkill() == "Restoration"
endFunction

bool function IsAlterationScroll(Scroll theScroll)
    return theScroll.GetMagicEffects()[0].GetAssociatedSkill() == "Alteration"
endFunction

bool function IsConjurationScroll(Scroll theScroll)
    return theScroll.GetMagicEffects()[0].GetAssociatedSkill() == "Conjuration"
endFunction

bool function IsDestructionScroll(Scroll theScroll)
    return theScroll.GetMagicEffects()[0].GetAssociatedSkill() == "Destruction"
endFunction

bool function IsIllusionScroll(Scroll theScroll)
    return theScroll.GetMagicEffects()[0].GetAssociatedSkill() == "Illusion"
endFunction

bool function IsRestorationScroll(Scroll theScroll)
    return theScroll.GetMagicEffects()[0].GetAssociatedSkill() == "Restoration"
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
