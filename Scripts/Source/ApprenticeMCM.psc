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

event OnConfigInit()
    ModName = "Apprentice"
    Pages = new string[3]
    Pages[0] = "Settings"
    Pages[1] = "Trained Skills"
    Pages[2] = "Skill Levels"
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
endEvent

event OnOptionSelect(int optionId)
    ApprenticeMCM_Settings.OnOptionSelect(self, optionId)
    ApprenticeMCM_TrainedSkills.OnOptionSelect(self, optionId)
endEvent

event OnOptionHighlight(int optionId)
    ApprenticeMCM_Settings.OnOptionHighlight(self, optionId)
    ApprenticeMCM_TrainedSkills.OnOptionHighlight(self, optionId)
endEvent

event OnOptionSliderOpen(int optionId)
    ApprenticeMCM_SkillLevels.OnOptionSliderOpen(self, optionId)
endEvent

event OnOptionSliderAccept(int optionId, float value)
    ApprenticeMCM_SkillLevels.OnOptionSliderAccept(self, optionId, value)
endEvent
