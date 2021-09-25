scriptName ApprenticeMCM extends SKI_ConfigBase

; Settings
GlobalVariable property Apprentice_ModEnabled auto
GlobalVariable property Apprentice_Settings_TrainFromBooks auto
GlobalVariable property Apprentice_Settings_DropOnEquip auto
GlobalVariable property Apprentice_Settings_NotificationOption auto ; (1) MessageBox, (2) Notification, (0) None
GlobalVariable property Apprentice_Settings_RestrictEnchantedItemUsage auto
int property oid_Settings_RestrictEnchantedItemUsage auto
int property oid_Settings_TrainFromBooks_Toggle auto
int property oid_Settings_LockTrainingMenu auto
int property TrainingMenuOptionFlag auto

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

event OnConfigInit()
    ModName = "Apprentice"
    Pages = new string[2]
    Pages[0] = "Settings"
    Pages[1] = "Trained Skills"
    ; Pages[0] = "Skills and Perks"
endEvent

event OnPageReset(string page)
    if page == ""
        LoadCustomContent("Apprentice\\Apprentice.dds")
    else
        UnloadCustomContent()
    endIf

    if TrainingMenuOptionFlag == 0
        TrainingMenuOptionFlag = OPTION_FLAG_NONE
    endIf
    ApprenticeMCM_Settings.Render(self, page)
    ApprenticeMCM_TrainedSkills.Render(self, page)
endEvent

event OnOptionSelect(int optionId)
    ApprenticeMCM_Settings.OnOptionSelect(self, optionId)
    ApprenticeMCM_TrainedSkills.OnOptionSelect(self, optionId)
endEvent

event OnOptionHighlight(int optionId)
    ApprenticeMCM_Settings.OnOptionHighlight(self, optionId)
    ApprenticeMCM_TrainedSkills.OnOptionHighlight(self, optionId)
endEvent
