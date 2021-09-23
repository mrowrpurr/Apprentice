scriptName ApprenticeMCM extends SKI_ConfigBase

GlobalVariable property Apprentice_Training_HeavyArmor auto
GlobalVariable property Apprentice_Training_LightArmor auto
GlobalVariable property Apprentice_Training_OneHanded auto
GlobalVariable property Apprentice_Training_TwoHanded auto
GlobalVariable property Apprentice_Training_Marksman auto
GlobalVariable property Apprentice_Training_Restoration auto
GlobalVariable property Apprentice_Training_Destruction auto
GlobalVariable property Apprentice_Training_Alchemy auto
GlobalVariable property Apprentice_Training_Enchanting auto

int property oid_TrainedSkills_Armor_LightArmor_Toggle auto
int property oid_TrainedSkills_Armor_HeavyArmor_Toggle auto

int property oid_TrainedSkills_Magic_Restoration_Toggle auto
int property oid_TrainedSkills_Magic_Destruction_Toggle auto
int property oid_TrainedSkills_Magic_Alchemy_Toggle auto
int property oid_TrainedSkills_Magic_Enchanting_Toggle auto

int property oid_TrainedSkills_Weapons_OneHanded_Toggle auto
int property oid_TrainedSkills_Weapons_TwoHanded_Toggle auto
int property oid_TrainedSkills_Weapons_Marksman_Toggle auto

event OnConfigInit()
    ModName = "Apprentice"
    Pages = new string[2]
    Pages[0] = "Settings"
    Pages[1] = "Trained Skills"
endEvent

event OnPageReset(string page)
    if page == "" ; "Home Page" - Show Logo
        LoadCustomContent("Apprentice/Apprentice.dds")
    else
        UnloadCustomContent()
    endIf
    ApprenticeMCM_TrainedSkills.Render(self, page)
endEvent

event OnOptionSelect(int optionId)
    ApprenticeMCM_TrainedSkills.OnOptionSelect(self, optionId)
endEvent
