scriptName ApprenticeMCM extends SKI_ConfigBase

; Player
Actor property PlayerRef auto

; Settings
GlobalVariable property Apprentice_ModEnabled auto
GlobalVariable property Apprentice_Settings_TrainFromBooks auto
GlobalVariable property Apprentice_Settings_DropOnEquip auto
GlobalVariable property Apprentice_Settings_NotificationOption auto ; (1) MessageBox, (2) Notification, (0) None
GlobalVariable property Apprentice_Settings_RestrictEnchantedItemUsage auto
int property oid_LockMenu auto
int property oid_Settings_RestrictEnchantedItemUsage auto
int property oid_Settings_TrainFromBooks_Toggle auto
int property LockableOptionFlag auto

; Armor
GlobalVariable property Apprentice_Training_HeavyArmor auto
GlobalVariable property Apprentice_Training_LightArmor auto
int property oid_TrainedSkills_Armor_LightArmor_Toggle auto
int property oid_TrainedSkills_Armor_HeavyArmor_Toggle auto

; Weapons
GlobalVariable property Apprentice_Training_Daggers auto
GlobalVariable property Apprentice_Training_OneHanded auto
GlobalVariable property Apprentice_Training_TwoHanded auto
GlobalVariable property Apprentice_Training_Marksman auto
int property oid_TrainedSkills_Weapons_Daggers_Toggle auto
int property oid_TrainedSkills_Weapons_OneHanded_Toggle auto
int property oid_TrainedSkills_Weapons_TwoHanded_Toggle auto
int property oid_TrainedSkills_Weapons_Marksman_Toggle auto

; Magic Skills
GlobalVariable property Apprentice_Training_Alchemy auto
GlobalVariable property Apprentice_Training_Enchanting auto
int property oid_TrainedSkills_Magic_Alchemy_Toggle auto
int property oid_TrainedSkills_Magic_Enchanting_Toggle auto

; Magic
GlobalVariable property Apprentice_Training_Alteration auto
GlobalVariable property Apprentice_Training_Conjuration auto
GlobalVariable property Apprentice_Training_Illusion auto
GlobalVariable property Apprentice_Training_Restoration auto
GlobalVariable property Apprentice_Training_Destruction auto
int property oid_TrainedSkills_Magic_Alteration_Toggle auto
int property oid_TrainedSkills_Magic_Conjuration_Toggle auto
int property oid_TrainedSkills_Magic_Destruction_Toggle auto
int property oid_TrainedSkills_Magic_Illusion_Toggle auto
int property oid_TrainedSkills_Magic_Restoration_Toggle auto

; Smithing
GlobalVariable property Apprentice_Training_Smithing auto
int property oid_TrainedSkills_Smithing_Toggle auto

; Block
GlobalVariable property Apprentice_Training_Block auto
int property oid_TrainedSkills_Block_Toggle auto

; Lockpicking & Pickpocket
GlobalVariable property Apprentice_Training_Lockpicking auto
GlobalVariable property Apprentice_Training_Pickpocket auto
int property oid_TrainedSkills_Lockpicking_Toggle auto
int property oid_TrainedSkills_Pickpocket_Toggle auto

; Perks and Skills
int property oid_AvailablePerkCount_Slider auto
int property oid_Skills_LightArmor_Slider auto
int property oid_Skills_HeavyArmor_Slider auto
int property oid_Skills_OneHanded_Slider auto
int property oid_Skills_TwoHanded_Slider auto
int property oid_Skills_Marksman_Slider auto
int property oid_Skills_Smithing_Slider auto
int property oid_Skills_Block_Slider auto
int property oid_Skills_Lockpicking_Slider auto
int property oid_Skills_Pickpocket_Slider auto
int property oid_Skills_Alteration_Slider auto
int property oid_Skills_Conjuration_Slider auto
int property oid_Skills_Destruction_Slider auto
int property oid_Skills_Illusion_Slider auto
int property oid_Skills_Restoration_Slider auto
int property oid_Skills_Alchemy_Slider auto
int property oid_Skills_Enchanting_Slider auto
int property oid_Skills_Speechcraft_Slider auto
int property oid_Skills_Sneak_Slider auto

; Allowlist Options
int property oid_Allowlist_Spells_Menu auto
int property oid_Allowlist_Items_Menu auto
Form[] property Allowlist_Spells_Cache auto ; These are used to
Form[] property Allowlist_Items_Cache auto ; manage the menus

event OnConfigInit()
    ModName = "Apprentice"
    Pages = new string[4]
    Pages[0] = "Settings"
    Pages[1] = "Trained Skills"
    Pages[2] = "Skill Levels"
    Pages[3] = ApprenticeMCM_ItemSpellAllowlist.PageName()
endEvent

event OnPageReset(string page)
    if page == ""
        LoadCustomContent("Apprentice\\Apprentice.dds")
    else
        UnloadCustomContent()
    endIf

    if LockableOptionFlag == 0
        LockableOptionFlag = OPTION_FLAG_NONE
    endIf
    ApprenticeMCM_Settings.Render(self, page)
    ApprenticeMCM_TrainedSkills.Render(self, page)
    ApprenticeMCM_SkillLevels.Render(self, page)
    ApprenticeMCM_ItemSpellAllowlist.Render(self, page)
endEvent

event OnOptionSelect(int optionId)
    ApprenticeMCM_Settings.OnOptionSelect(self, optionId)
    ApprenticeMCM_TrainedSkills.OnOptionSelect(self, optionId)
endEvent

event OnOptionHighlight(int optionId)
    ApprenticeMCM_Settings.OnOptionHighlight(self, optionId)
    ApprenticeMCM_TrainedSkills.OnOptionHighlight(self, optionId)
    ApprenticeMCM_ItemSpellAllowlist.OnOptionHighlight(self, optionId)
endEvent

event OnOptionSliderOpen(int optionId)
    ApprenticeMCM_SkillLevels.OnOptionSliderOpen(self, optionId)
endEvent

event OnOptionSliderAccept(int optionId, float value)
    ApprenticeMCM_SkillLevels.OnOptionSliderAccept(self, optionId, value)
endEvent

event OnOptionMenuOpen(int optionId)
    ApprenticeMCM_ItemSpellAllowlist.OnOptionMenuOpen(self, optionId)
endEvent

event OnOptionMenuAccept(int optionId, int index)
    ApprenticeMCM_ItemSpellAllowlist.OnOptionMenuAccept(self, optionId, index)
endEvent

ApprenticePlayer function GetPlayerScript()
    return GetAliasByName("PlayerRef") as ApprenticePlayer
endFunction

string[] function GetPlayerInventoryItemNamesNotAlreadyOnAllowlist()
    ApprenticePlayer playerScript = GetPlayerScript()
    Form[] currentlyAllowedItems = playerScript.AllowedItems

    Actor player = Game.GetPlayer()
    int itemCount = player.GetNumItems()
    
    string[] itemNames = Utility.CreateStringArray(itemCount)
    Allowlist_Items_Cache = Utility.CreateFormArray(itemCount)

    int i = 0
    int itemIndex = 0
    while i < itemCount
        Form   theForm   = player.GetNthForm(i)
        Weapon theWeapon = theForm as Weapon
        Scroll theScroll = theForm as Scroll
        Armor  theAmor   = theForm as Armor
        bool validType   = theWeapon || theScroll || theAmor
        if validType && (! currentlyAllowedItems || currentlyAllowedItems.Find(theForm) == -1)
            itemNames[itemIndex] = theForm.GetName()
            Allowlist_Items_Cache[itemIndex] = theForm
            itemIndex += 1
        endIf
        i += 1
    endWhile

    if itemNames.Length != itemIndex
        itemNames = Utility.ResizeStringArray(itemNames, itemIndex)
    endIf
    if Allowlist_Items_Cache.Length != itemIndex
        Allowlist_Items_Cache = Utility.ResizeFormArray(Allowlist_Items_Cache, itemIndex)
    endIf

    return itemNames
endFunction
