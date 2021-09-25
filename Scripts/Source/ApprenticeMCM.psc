scriptName ApprenticeMCM extends SKI_ConfigBase

; Options - THESE 3 ARE NOT YET USED
GlobalVariable property Apprentice_ModEnabled auto
GlobalVariable property Apprentice_Settings_DropOnEquip auto
GlobalVariable property Apprentice_Settings_NotificationOption auto ; (1) MessageBox, (2) Notification, (0) None
GlobalVariable property Apprentice_Settings_RestrictEnchantedItemUsage auto
int property oid_Settings_RestrictEnchantedItemUsage auto

; Armor
GlobalVariable property Apprentice_Training_HeavyArmor auto
GlobalVariable property Apprentice_Training_LightArmor auto
int property oid_TrainedSkills_Armor_LightArmor_Toggle auto
int property oid_TrainedSkills_Armor_HeavyArmor_Toggle auto

; Weapons
GlobalVariable property Apprentice_Training_OneHanded auto
GlobalVariable property Apprentice_Training_TwoHanded auto
GlobalVariable property Apprentice_Training_Marksman auto
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
    Pages = new string[1]
    Pages[0] = "Trained Skills"
endEvent

event OnPageReset(string page)
    ApprenticeMCM_TrainedSkills.Render(self, page)
endEvent

event OnOptionSelect(int optionId)
    ApprenticeMCM_TrainedSkills.OnOptionSelect(self, optionId)
endEvent

event OnOptionHighlight(int optionId)
    ApprenticeMCM_TrainedSkills.OnOptionHighlight(self, optionId)
endEvent
