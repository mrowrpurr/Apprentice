ConstantPool "_global" "CraftingMenu" "CraftingMenuInstance" "bCanExpandPanel" "bHideAdditionalDescription" "ButtonText" "" "Array" "CategoryList" "InventoryLists" "ItemInfo" "ItemInfoHolder" "Mouse" "addListener" "onConfigLoad" "skyui" "util" "ConfigManager" "registerLoadCallback" "navPanel" "BottomBarInfo" "buttonPanel" "MovieClip" "prototype" "__get__bCanCraft" "_bCanCraft" "__set__bCanCraft" "UpdateButtonText" "__get__bCanFadeItemInfo" "SetCanFadeItemInfo" "CanFadeItemInfo" "gfx" "io" "GameDelegate" "call" "_bCanFadeItemInfo" "__get__bItemCardAdditionalDescription" "_bItemCardAdditionalDescription" "__set__bItemCardAdditionalDescription" "AdditionalDescription" "text" "Initialize" "skse" "ExtendData" "ExtendAlchemyCategories" "_subtypeName" "SUBTYPE_NAMES" "_currentframe" "default" "gotoAndStop" "onEndEditItemName" "endEditItemName" "addEventListener" "onSubMenuAction" "subMenuAction" "AdditionalDescriptionHolder" "textAutoSize" "shrink" "MenuName" "MenuNameHolder" "autoSize" "left" "_visible" "MenuDescription" "MenuDescriptionHolder" "center" "InitExtensions" "managers" "FocusHandler" "__get__instance" "setFocus" "onItemHighlightChange" "itemHighlightChange" "onShowItemsList" "showItemsList" "onHideItemsList" "hideItemsList" "onCategoryListChange" "categoryChange" "ItemList" "itemList" "onItemSelect" "itemPress" "ExitMenuRect" "onPress" "CloseMenu" "positionFixedElements" "SetPartitionedFilterMode" "setPartitionedFilterMode" "GetNumCategories" "CategoriesList" "__get__entryList" "length" "clearButtons" "getItemShown" "SELECT_BUTTON" "controls" "defines" "Input" "Activate" "addButton" "$Exit" "_cancelControls" "$Search" "_searchControls" "_platform" "$Column" "_sortColumnControls" "$Order" "_sortOrderControls" "CRAFT_BUTTON" "XButton" "AUX_BUTTON" "YButton" "updateButtons" "UpdateItemList" "ConstructibleObject" "InvalidateListData" "UpdateList" "UpdateItemDisplay" "FadeInfoCard" "__get__selectedIndex" "SetSelectedItem" "ShowItem3D" "FadeOutCard" "FadeInCard" "PreRebuildList" "PostRebuildList" "SetPlatform" "_acceptControls" "Enter" "Tab" "Accept" "Cancel" "SortColumn" "SortOrder" "Space" "setPlatform" "UpdateIngredients" "GetItemName" ": " "getNewTextFormat" "color" "PlayerCount" "RequiredCount" "setNewTextFormat" " " " (" ")" "Name" ", " "replaceText" "EditItemName" "StartEditName" "ShowSlider" "ShowEnchantingSlider" "quantitySlider" "snapping" "snapInterval" "onSliderChanged" "change" "SetSliderValue" "value" "handleInput" "slice" "Shared" "GlobalFunc" "SetLockFunction" "L" "Lock" "_x" "LIST_OFFSET" "TR" "Stage" "visibleRect" "x" "safeRect" "width" "getContentBounds" "_width" "positionElements" "TL" "_y" "y" "positionFloatingElements" "_parent" "_config" "itemcard" "background" "_height" "align" "xOffset" "right" "yOffset" "T" "MouseRotationRect" "height" "config" "setConfig" "showPanel" "CraftingDataSetter" "addDataProcessor" "Appearance" "CraftingIconSetter" "listState" "iconSource" "icons" "item" "source" "showStolenIcon" "showStolen" "defaultEnabledColor" "colors" "enabled" "negativeEnabledColor" "negative" "stolenEnabledColor" "stolen" "defaultDisabledColor" "disabled" "negativeDisabledColor" "stolenDisabledColor" "EnchantConstruct" "EnchantListLayout" "ListLayout" "components" "list" "ListLayoutManager" "createLayout" "Smithing" "SmithingListLayout" "ConstructListLayout" "AlchemyListLayout" "entryWidth" "CraftingLists" "SHORT_LIST_OFFSET" "__set__layout" "gamepad" "prevColumn" "nextColumn" "sortOrder" "keyCode" "_searchKey" "pc" "search" "onItemListPressed" "CraftSelectedItem" "index" "ChooseItem" "SetSelectedCategory" "SetChargeValues" "CalculateCharge" "opening" "disableSelection" "disableInput" "menu" "quantity" "canceled" "SliderClose" "onCraftButtonPress" "CraftButtonPress" "onExitButtonPress" "onAuxButtonPress" "AuxButtonPress" "EndEditName" "newName" "useNewName" "EndItemRename" "onMouseUp" "bEditNameMode" "_ymouse" "_xmouse" "hitTest" "onMouseRotationStart" "StartMouseRotation" "onMouseRotationStop" "StopMouseRotation" "onItemsListInputCatcherClick" "onMouseRotationFastClick" "SKYUI_RELEASE_IDX" "SKYUI_VERSION_MAJOR" "SKYUI_VERSION_MINOR" "SKYUI_VERSION_STRING" "." " SE" "EXIT_BUTTON" "Alchemy" "EnchantDestruct" "currentMenuType" "dbgIntvl" "ASSetPropFlags"
Push "_global"
GetVariable
Push "CraftingMenu"
GetMember
Not
Not
If loc377d
Push "CraftingMenu"
DefineFunction2 "" 0 3 false false true true true false false true false  {
Push 0 register2 undefined
CallMethod
Pop
Push "CraftingMenu"
GetVariable
Push "CraftingMenuInstance" register1
SetMember
Push register1 "bCanExpandPanel" true
SetMember
Push register1 "bHideAdditionalDescription" false
SetMember
Push register1 "ButtonText" "" "" "" "" 4 "Array"
NewObject
SetMember
Push register1 "CategoryList" register1 "InventoryLists"
GetMember
SetMember
Push register1 "ItemInfo" register1 "ItemInfoHolder"
GetMember
Push "ItemInfo"
GetMember
SetMember
Push register1 1 "Mouse"
GetVariable
Push "addListener"
CallMethod
Pop
Push "onConfigLoad" register1 2 "skyui"
GetVariable
Push "util"
GetMember
Push "ConfigManager"
GetMember
Push "registerLoadCallback"
CallMethod
Pop
Push register1 "navPanel" register1 "BottomBarInfo"
GetMember
Push "buttonPanel"
GetMember
SetMember
}
StoreRegister 1
SetVariable
Push "_global"
GetVariable
Push "CraftingMenu"
GetMember
Push "MovieClip"
GetVariable
Extends
Push register1 "prototype"
GetMember
StoreRegister 2
Pop
Push register2 "__get__bCanCraft"
DefineFunction2 "" 0 2 false false true false true false false true false  {
Push register1 "_bCanCraft"
GetMember
Return
}
SetMember
Push register2 "__set__bCanCraft"
DefineFunction2 "" 1 3 false false true false true false false true false 2 "abCanCraft"  {
Push register1 "_bCanCraft" register2
SetMember
Push 0 register1 "UpdateButtonText"
CallMethod
Pop
Push 0 register1 "__get__bCanCraft"
CallMethod
Return
}
SetMember
Push register2 "__get__bCanFadeItemInfo"
DefineFunction2 "" 0 2 false false true false true false false true false  {
Push "SetCanFadeItemInfo" register1 0
InitArray
Push "CanFadeItemInfo" 4 "gfx"
GetVariable
Push "io"
GetMember
Push "GameDelegate"
GetMember
Push "call"
CallMethod
Pop
Push register1 "_bCanFadeItemInfo"
GetMember
Return
}
SetMember
Push register2 "SetCanFadeItemInfo"
DefineFunction2 "" 1 3 false false true false true false false true false 2 "abCanFade"  {
Push register1 "_bCanFadeItemInfo" register2
SetMember
}
SetMember
Push register2 "__get__bItemCardAdditionalDescription"
DefineFunction2 "" 0 2 false false true false true false false true false  {
Push register1 "_bItemCardAdditionalDescription"
GetMember
Return
}
SetMember
Push register2 "__set__bItemCardAdditionalDescription"
DefineFunction2 "" 1 3 false false true false true false false true false 2 "abItemCardDesc"  {
Push register1 "_bItemCardAdditionalDescription" register2
SetMember
Push register2
Not
If loc1121
Push register1 "AdditionalDescription"
GetMember
Push "text" ""
SetMember
loc1121:Push 0 register1 "__get__bItemCardAdditionalDescription"
CallMethod
Return
}
SetMember
Push register2 "Initialize"
DefineFunction2 "" 0 2 false false true false true false false true false  {
Push true 1 "skse"
GetVariable
Push "ExtendData"
CallMethod
Pop
Push true 1 "skse"
GetVariable
Push "ExtendAlchemyCategories"
CallMethod
Pop
Push register1 "_subtypeName" "CraftingMenu"
GetVariable
Push "SUBTYPE_NAMES"
GetMember
Push register1 "_currentframe"
GetMember
Push 1
Subtract
GetMember
SetMember
Push register1 "ItemInfoHolder" register1 "ItemInfoHolder"
GetMember
SetMember
Push "default" 1 register1 "ItemInfoHolder"
GetMember
Push "gotoAndStop"
CallMethod
Pop
Push "onEndEditItemName" register1 "endEditItemName" 3 register1 "ItemInfo"
GetMember
Push "addEventListener"
CallMethod
Pop
Push "onSubMenuAction" register1 "subMenuAction" 3 register1 "ItemInfo"
GetMember
Push "addEventListener"
CallMethod
Pop
Push register1 "BottomBarInfo" register1 "BottomBarInfo"
GetMember
SetMember
Push register1 "AdditionalDescriptionHolder" register1 "ItemInfoHolder"
GetMember
Push "AdditionalDescriptionHolder"
GetMember
SetMember
Push register1 "AdditionalDescription" register1 "AdditionalDescriptionHolder"
GetMember
Push "AdditionalDescription"
GetMember
SetMember
Push register1 "AdditionalDescription"
GetMember
Push "textAutoSize" "shrink"
SetMember
Push register1 "MenuName" register1 "MenuNameHolder"
GetMember
Push "MenuName"
GetMember
SetMember
Push register1 "MenuName"
GetMember
Push "autoSize" "left"
SetMember
Push register1 "MenuNameHolder"
GetMember
Push "_visible" false
SetMember
Push register1 "MenuDescription" register1 "MenuDescriptionHolder"
GetMember
Push "MenuDescription"
GetMember
SetMember
Push register1 "MenuDescription"
GetMember
Push "autoSize" "center"
SetMember
Push register1 "_subtypeName"
GetMember
Push 1 register1 "CategoryList"
GetMember
Push "InitExtensions"
CallMethod
Pop
Push 0 register1 "CategoryList"
GetMember
Push 2 0 "gfx"
GetVariable
Push "managers"
GetMember
Push "FocusHandler"
GetMember
Push "__get__instance"
CallMethod
Push "setFocus"
CallMethod
Pop
Push "onItemHighlightChange" register1 "itemHighlightChange" 3 register1 "CategoryList"
GetMember
Push "addEventListener"
CallMethod
Pop
Push "onShowItemsList" register1 "showItemsList" 3 register1 "CategoryList"
GetMember
Push "addEventListener"
CallMethod
Pop
Push "onHideItemsList" register1 "hideItemsList" 3 register1 "CategoryList"
GetMember
Push "addEventListener"
CallMethod
Pop
Push "onCategoryListChange" register1 "categoryChange" 3 register1 "CategoryList"
GetMember
Push "addEventListener"
CallMethod
Pop
Push register1 "ItemList" register1 "CategoryList"
GetMember
Push "itemList"
GetMember
SetMember
Push "onItemSelect" register1 "itemPress" 3 register1 "ItemList"
GetMember
Push "addEventListener"
CallMethod
Pop
Push register1 "ExitMenuRect"
GetMember
Push "onPress"
DefineFunction2 "" 0 1 false false true false true false true false false  {
Push 0
InitArray
Push "CloseMenu" 2 "gfx"
GetVariable
Push "io"
GetMember
Push "GameDelegate"
GetMember
Push "call"
CallMethod
Pop
}
SetMember
Push false 1 register1 "__set__bCanCraft"
CallMethod
Pop
Push 0 register1 "positionFixedElements"
CallMethod
Pop
}
SetMember
Push register2 "SetPartitionedFilterMode"
DefineFunction2 "" 1 3 false false true false true false false true false 2 "a_bPartitioned"  {
Push register2 1 register1 "CategoryList"
GetMember
Push "setPartitionedFilterMode"
CallMethod
Pop
}
SetMember
Push register2 "GetNumCategories"
DefineFunction2 "" 0 2 false false true false true false false true false  {
Push 0 register1 "CategoryList"
GetMember
Push "CategoriesList"
GetMember
Push "__get__entryList"
CallMethod
Push "length"
GetMember
Return
}
SetMember
Push register2 "UpdateButtonText"
DefineFunction2 "" 0 2 false false true false true false false true false  {
Push 0 register1 "navPanel"
GetMember
Push "clearButtons"
CallMethod
Pop
Push 0 register1 "getItemShown"
CallMethod
Not
If loc1604
Push "text" register1 "ButtonText"
GetMember
Push "CraftingMenu"
GetVariable
Push "SELECT_BUTTON"
GetMember
GetMember
Push "controls" "skyui"
GetVariable
Push "defines"
GetMember
Push "Input"
GetMember
Push "Activate"
GetMember
Push 2
InitObject
Push 1 register1 "navPanel"
GetMember
Push "addButton"
CallMethod
Pop
Jump loc1713
loc1604:Push "text" "$Exit" "controls" register1 "_cancelControls"
GetMember
Push 2
InitObject
Push 1 register1 "navPanel"
GetMember
Push "addButton"
CallMethod
Pop
Push "text" "$Search" "controls" register1 "_searchControls"
GetMember
Push 2
InitObject
Push 1 register1 "navPanel"
GetMember
Push "addButton"
CallMethod
Pop
Push register1 "_platform"
GetMember
Push 0
Equals2
Not
Not
If loc1713
Push "text" "$Column" "controls" register1 "_sortColumnControls"
GetMember
Push 2
InitObject
Push 1 register1 "navPanel"
GetMember
Push "addButton"
CallMethod
Pop
Push "text" "$Order" "controls" register1 "_sortOrderControls"
GetMember
Push 2
InitObject
Push 1 register1 "navPanel"
GetMember
Push "addButton"
CallMethod
Pop
loc1713:Push 0 register1 "__get__bCanCraft"
CallMethod
PushDuplicate
Not
If loc174d
Pop
Push register1 "ButtonText"
GetMember
Push "CraftingMenu"
GetVariable
Push "CRAFT_BUTTON"
GetMember
GetMember
Push ""
Equals2
Not
loc174d:Not
If loc17b0
Push "text" register1 "ButtonText"
GetMember
Push "CraftingMenu"
GetVariable
Push "CRAFT_BUTTON"
GetMember
GetMember
Push "controls" "skyui"
GetVariable
Push "defines"
GetMember
Push "Input"
GetMember
Push "XButton"
GetMember
Push 2
InitObject
Push 1 register1 "navPanel"
GetMember
Push "addButton"
CallMethod
Pop
loc17b0:Push 0 register1 "__get__bCanCraft"
CallMethod
PushDuplicate
Not
If loc17ea
Pop
Push register1 "ButtonText"
GetMember
Push "CraftingMenu"
GetVariable
Push "AUX_BUTTON"
GetMember
GetMember
Push ""
Equals2
Not
loc17ea:Not
If loc184d
Push "text" register1 "ButtonText"
GetMember
Push "CraftingMenu"
GetVariable
Push "AUX_BUTTON"
GetMember
GetMember
Push "controls" "skyui"
GetVariable
Push "defines"
GetMember
Push "Input"
GetMember
Push "YButton"
GetMember
Push 2
InitObject
Push 1 register1 "navPanel"
GetMember
Push "addButton"
CallMethod
Pop
loc184d:Push true 1 register1 "navPanel"
GetMember
Push "updateButtons"
CallMethod
Pop
}
SetMember
Push register2 "UpdateItemList"
DefineFunction2 "" 1 3 false false true false true false false true false 2 "abFullRebuild"  {
Push register1 "_subtypeName"
GetMember
Push "ConstructibleObject"
Equals2
Not
If loc18b2
Push true
StoreRegister 2
Pop
loc18b2:Push register2 true
Equals2
Not
If loc18e2
Push 0 register1 "CategoryList"
GetMember
Push "InvalidateListData"
CallMethod
Pop
Jump loc18fc
loc18e2:Push 0 register1 "ItemList"
GetMember
Push "UpdateList"
CallMethod
Pop
}
loc18fc:SetMember
Push register2 "UpdateItemDisplay"
DefineFunction2 "" 0 3 false false true false true false false true false  {
Push 0 register1 "getItemShown"
CallMethod
StoreRegister 2
Pop
Push register2
Not
Push 1 register1 "FadeInfoCard"
CallMethod
Pop
Push 0 register1 "ItemList"
GetMember
Push "__get__selectedIndex"
CallMethod
Push 1 register1 "SetSelectedItem"
CallMethod
Pop
Push register2 1
InitArray
Push "ShowItem3D" 2 "gfx"
GetVariable
Push "io"
GetMember
Push "GameDelegate"
GetMember
Push "call"
CallMethod
Pop
}
SetMember
Push register2 "FadeInfoCard"
DefineFunction2 "" 1 3 false false true false true false false true false 2 "abFadeOut"  {
Push register2
PushDuplicate
Not
If loc19e6
Pop
Push 0 register1 "__get__bCanFadeItemInfo"
CallMethod
loc19e6:Not
If loc1a32
Push 0 register1 "ItemInfo"
GetMember
Push "FadeOutCard"
CallMethod
Pop
Push register1 "bHideAdditionalDescription"
GetMember
Not
If loc1a2d
Push register1 "AdditionalDescriptionHolder"
GetMember
Push "_visible" false
SetMember
loc1a2d:Push undefined
Return
loc1a32:Push register2
Not
If loc1a42
Push undefined
Return
loc1a42:Push 0 register1 "ItemInfo"
GetMember
Push "FadeInCard"
CallMethod
Pop
Push register1 "bHideAdditionalDescription"
GetMember
Not
If loc1a83
Push register1 "AdditionalDescriptionHolder"
GetMember
Push "_visible" true
SetMember
}
loc1a83:SetMember
Push register2 "SetSelectedItem"
DefineFunction2 "" 1 2 false false true false true false true false false 1 "aSelection"  {
Push register1 1
InitArray
Push "SetSelectedItem" 2 "gfx"
GetVariable
Push "io"
GetMember
Push "GameDelegate"
GetMember
Push "call"
CallMethod
Pop
}
SetMember
Push register2 "PreRebuildList"
DefineFunction "" 0  {
}
SetMember
Push register2 "PostRebuildList"
DefineFunction2 "" 1 0 false false true false true false true false false 1 "abRestoreSelection"  {
}
SetMember
Push register2 "SetPlatform"
DefineFunction2 "" 2 4 false false true false true false false true false 2 "a_platform" 3 "a_bPS3Switch"  {
Push register1 "_platform" register2
SetMember
Push register2 0
Equals2
Not
If loc1bb5
Push register1 "_acceptControls" "skyui"
GetVariable
Push "defines"
GetMember
Push "Input"
GetMember
Push "Enter"
GetMember
SetMember
Push register1 "_cancelControls" "skyui"
GetVariable
Push "defines"
GetMember
Push "Input"
GetMember
Push "Tab"
GetMember
SetMember
Jump loc1c41
loc1bb5:Push register1 "_acceptControls" "skyui"
GetVariable
Push "defines"
GetMember
Push "Input"
GetMember
Push "Accept"
GetMember
SetMember
Push register1 "_cancelControls" "skyui"
GetVariable
Push "defines"
GetMember
Push "Input"
GetMember
Push "Cancel"
GetMember
SetMember
Push register1 "_sortColumnControls" "skyui"
GetVariable
Push "defines"
GetMember
Push "Input"
GetMember
Push "SortColumn"
GetMember
SetMember
Push register1 "_sortOrderControls" "skyui"
GetVariable
Push "defines"
GetMember
Push "Input"
GetMember
Push "SortOrder"
GetMember
SetMember
loc1c41:Push register1 "_searchControls" "skyui"
GetVariable
Push "defines"
GetMember
Push "Input"
GetMember
Push "Space"
GetMember
SetMember
Push register3 register2 2 register1 "ItemInfo"
GetMember
Push "SetPlatform"
CallMethod
Pop
Push register3 register2 2 register1 "BottomBarInfo"
GetMember
Push "setPlatform"
CallMethod
Pop
Push register3 register2 2 register1 "CategoryList"
GetMember
Push "setPlatform"
CallMethod
Pop
}
SetMember
Push register2 "UpdateIngredients"
DefineFunction2 "" 3 13 false false true false true false false true false 2 "aLineTitle" 3 "aIngredients" 4 "abShowPlayerCount"  {
Push 0 register1 "__get__bItemCardAdditionalDescription"
CallMethod
If loc1d3b
Push register1 "AdditionalDescription"
GetMember
Jump loc1d54
loc1d3b:Push 0 register1 "ItemInfo"
GetMember
Push "GetItemName"
CallMethod
loc1d54:StoreRegister 5
Pop
Push register5 "text" register2 undefined
Equals2
Not
PushDuplicate
Not
If loc1d8a
Pop
Push register2 "length"
GetMember
Push 0
Greater
loc1d8a:If loc1d99
Push ""
Jump loc1da4
loc1d99:Push register2 ": "
Add2
loc1da4:SetMember
Push 0 register5 "getNewTextFormat"
CallMethod
StoreRegister 6
Pop
Push 0 register5 "getNewTextFormat"
CallMethod
StoreRegister 7
Pop
Push 0
StoreRegister 8
Pop
loc1de2:Push register8 register3 "length"
GetMember
Less2
Not
If loc1f84
Push register3 register8
GetMember
StoreRegister 9
Pop
Push register7 "color" register9 "PlayerCount"
GetMember
Push register9 "RequiredCount"
GetMember
Less2
Not
Not
If loc1e3e
Push 16777215
Jump loc1e46
loc1e3e:Push 7829367
loc1e46:SetMember
Push register7 1 register5 "setNewTextFormat"
CallMethod
Pop
Push ""
StoreRegister 10
Pop
Push register9 "RequiredCount"
GetMember
Push 1
Greater
Not
If loc1e9a
Push register9 "RequiredCount"
GetMember
Push " "
Add2
StoreRegister 10
Pop
loc1e9a:Push ""
StoreRegister 11
Pop
Push register4
PushDuplicate
Not
If loc1ec6
Pop
Push register9 "PlayerCount"
GetMember
Push 1
Less2
Not
loc1ec6:Not
If loc1ee8
Push " (" register9 "PlayerCount"
GetMember
Add2
Push ")"
Add2
StoreRegister 11
Pop
loc1ee8:Push register10 register9 "Name"
GetMember
Add2
Push register11
Add2
Push register8 register3 "length"
GetMember
Push 1
Subtract
Less2
Not
If loc1f29
Push ", "
Jump loc1f2e
loc1f29:Push ""
loc1f2e:Add2
StoreRegister 12
Pop
Push register12 register5 "length"
GetMember
Push 1
Add2
Push register5 "length"
GetMember
Push 3 register5 "replaceText"
CallMethod
Pop
Push register8 1
Add2
StoreRegister 8
Pop
Jump loc1de2
loc1f84:Push register6 1 register5 "setNewTextFormat"
CallMethod
Pop
}
SetMember
Push register2 "EditItemName"
DefineFunction2 "" 2 4 false false true false true false false true false 2 "aInitialText" 3 "aMaxChars"  {
Push register3 register2 2 register1 "ItemInfo"
GetMember
Push "StartEditName"
CallMethod
Pop
}
SetMember
Push register2 "ShowSlider"
DefineFunction2 "" 4 6 false false true false true false false true false 2 "aiMaxValue" 3 "aiMinValue" 4 "aiCurrentValue" 5 "aiSnapInterval"  {
Push register4 register3 register2 3 register1 "ItemInfo"
GetMember
Push "ShowEnchantingSlider"
CallMethod
Pop
Push register1 "ItemInfo"
GetMember
Push "quantitySlider"
GetMember
Push "snapping" true
SetMember
Push register1 "ItemInfo"
GetMember
Push "quantitySlider"
GetMember
Push "snapInterval" register5
SetMember
Push "onSliderChanged" register1 "change" 3 register1 "ItemInfo"
GetMember
Push "quantitySlider"
GetMember
Push "addEventListener"
CallMethod
Pop
Push 0 register1 "onSliderChanged"
CallMethod
Pop
}
SetMember
Push register2 "SetSliderValue"
DefineFunction2 "" 1 3 false false true false true false false true false 2 "aValue"  {
Push register1 "ItemInfo"
GetMember
Push "quantitySlider"
GetMember
Push "value" register2
SetMember
}
SetMember
Push register2 "handleInput"
DefineFunction2 "" 2 3 false false true false true false true false false 1 "aInputEvent" 2 "aPathToFocus"  {
Push 1 1 register2 "slice"
CallMethod
Push register1 2 register2 0
GetMember
Push "handleInput"
CallMethod
Pop
Push true
Return
}
SetMember
Push register2 "positionFixedElements"
DefineFunction2 "" 0 6 false false true false true false false true false  {
Push 0 "Shared"
GetVariable
Push "GlobalFunc"
GetMember
Push "SetLockFunction"
CallMethod
Pop
Push "L" 1 "MovieClip"
GetVariable
Push register1 "CategoryList"
GetMember
CastOp
Push "Lock"
CallMethod
Pop
Push register1 "CategoryList"
GetMember
Push "_x" register1 "CategoryList"
GetMember
Push "_x"
GetMember
Push "CraftingMenu"
GetVariable
Push "LIST_OFFSET"
GetMember
Subtract
SetMember
Push "L" 1 register1 "MenuNameHolder"
GetMember
Push "Lock"
CallMethod
Pop
Push register1 "MenuNameHolder"
GetMember
Push "_x" register1 "MenuNameHolder"
GetMember
Push "_x"
GetMember
Push "CraftingMenu"
GetVariable
Push "LIST_OFFSET"
GetMember
Subtract
SetMember
Push "TR" 1 register1 "MenuDescriptionHolder"
GetMember
Push "Lock"
CallMethod
Pop
Push "Stage"
GetVariable
Push "visibleRect"
GetMember
Push "x"
GetMember
Push "Stage"
GetVariable
Push "safeRect"
GetMember
Push "x"
GetMember
Add2
StoreRegister 2
Pop
Push "Stage"
GetVariable
Push "visibleRect"
GetMember
Push "x"
GetMember
Push "Stage"
GetVariable
Push "visibleRect"
GetMember
Push "width"
GetMember
Add2
Push "Stage"
GetVariable
Push "safeRect"
GetMember
Push "x"
GetMember
Subtract
StoreRegister 3
Pop
Push 0 register1 "CategoryList"
GetMember
Push "getContentBounds"
CallMethod
StoreRegister 4
Pop
Push register1 "CategoryList"
GetMember
Push "_x"
GetMember
Push register4 0
GetMember
Add2
Push register4 2
GetMember
Add2
Push 25
Add2
StoreRegister 5
Pop
Push register1 "MenuDescriptionHolder"
GetMember
Push "_x" 10 register5
Add2
Push register3 register5
Subtract
Push 2
Divide
Add2
Push register1 "MenuDescriptionHolder"
GetMember
Push "_width"
GetMember
Push 2
Divide
Add2
SetMember
Push register3 register2 2 register1 "BottomBarInfo"
GetMember
Push "positionElements"
CallMethod
Pop
Push "TL" 1 "MovieClip"
GetVariable
Push register1 "ExitMenuRect"
GetMember
CastOp
Push "Lock"
CallMethod
Pop
Push register1 "ExitMenuRect"
GetMember
Push "_x" register1 "ExitMenuRect"
GetMember
Push "_x"
GetMember
Push "Stage"
GetVariable
Push "safeRect"
GetMember
Push "x"
GetMember
Push 10
Add2
Subtract
SetMember
Push register1 "ExitMenuRect"
GetMember
Push "_y" register1 "ExitMenuRect"
GetMember
Push "_y"
GetMember
Push "Stage"
GetVariable
Push "safeRect"
GetMember
Push "y"
GetMember
Subtract
SetMember
}
SetMember
Push register2 "positionFloatingElements"
DefineFunction2 "" 0 10 false false true false true false false true false  {
Push "Stage"
GetVariable
Push "visibleRect"
GetMember
Push "x"
GetMember
Push "Stage"
GetVariable
Push "safeRect"
GetMember
Push "x"
GetMember
Add2
StoreRegister 2
Pop
Push "Stage"
GetVariable
Push "visibleRect"
GetMember
Push "x"
GetMember
Push "Stage"
GetVariable
Push "visibleRect"
GetMember
Push "width"
GetMember
Add2
Push "Stage"
GetVariable
Push "safeRect"
GetMember
Push "x"
GetMember
Subtract
StoreRegister 3
Pop
Push 0 register1 "CategoryList"
GetMember
Push "getContentBounds"
CallMethod
StoreRegister 4
Pop
Push register1 "CategoryList"
GetMember
Push "_x"
GetMember
Push register4 0
GetMember
Add2
Push register4 2
GetMember
Add2
Push 25
Add2
StoreRegister 5
Pop
Push register1 "ItemInfo"
GetMember
Push "_parent"
GetMember
StoreRegister 6
Pop
Push register1 "_config"
GetMember
Push "ItemInfo"
GetMember
Push "itemcard"
GetMember
StoreRegister 7
Pop
Push undefined
StoreRegister 8
Pop
Push register1 "ItemInfo"
GetMember
Push "background"
GetMember
Push undefined
Equals2
Not
Not
If loc25a2
Push register1 "ItemInfo"
GetMember
Push "background"
GetMember
Push "_width"
GetMember
StoreRegister 8
Pop
Jump loc25b8
loc25a2:Push register1 "ItemInfo"
GetMember
Push "_width"
GetMember
StoreRegister 8
Pop
loc25b8:Push register3 register5
Subtract
Push register6 "_width"
GetMember
Divide
StoreRegister 9
Pop
Push register9 1
Less2
Not
If loc2630
Push register6 "_width" register6 "_width"
GetMember
Push register9
Multiply
SetMember
Push register6 "_height" register6 "_height"
GetMember
Push register9
Multiply
SetMember
Push register8 register9
Multiply
StoreRegister 8
Pop
loc2630:Push register7 "align"
GetMember
Push "left"
Equals2
Not
If loc2668
Push register6 "_x" register5 register7 "xOffset"
GetMember
Add2
SetMember
Jump loc26fd
loc2668:Push register7 "align"
GetMember
Push "right"
Equals2
Not
If loc26a6
Push register6 "_x" register3 register8
Subtract
Push register7 "xOffset"
GetMember
Add2
SetMember
Jump loc26fd
loc26a6:Push register6 "_x" register5 register7 "xOffset"
GetMember
Add2
Push "Stage"
GetVariable
Push "visibleRect"
GetMember
Push "x"
GetMember
Push "Stage"
GetVariable
Push "visibleRect"
GetMember
Push "width"
GetMember
Add2
Push register5
Subtract
Push register8
Subtract
Push 2
Divide
Add2
SetMember
loc26fd:Push register6 "_y" register6 "_y"
GetMember
Push register7 "yOffset"
GetMember
Add2
SetMember
Push "T" 1 "MovieClip"
GetVariable
Push register1 "MouseRotationRect"
GetMember
CastOp
Push "Lock"
CallMethod
Pop
Push register1 "MouseRotationRect"
GetMember
Push "_x" register1 "ItemInfo"
GetMember
Push "_parent"
GetMember
Push "_x"
GetMember
SetMember
Push register1 "MouseRotationRect"
GetMember
Push "_width" register1 "ItemInfo"
GetMember
Push "_parent"
GetMember
Push "_width"
GetMember
SetMember
Push register1 "MouseRotationRect"
GetMember
Push "_height" 0.55 "Stage"
GetVariable
Push "visibleRect"
GetMember
Push "height"
GetMember
Multiply
SetMember
}
SetMember
Push register2 "onConfigLoad"
DefineFunction2 "" 1 3 false false true false true false false true false 2 "event"  {
Push register2 "config"
GetMember
Push 1 register1 "setConfig"
CallMethod
Pop
Push 0 register1 "CategoryList"
GetMember
Push "showPanel"
CallMethod
Pop
}
SetMember
Push register2 "setConfig"
DefineFunction2 "" 1 9 false false true false true false false true false 2 "a_config"  {
Push register1 "_config" register2
SetMember
Push 0 "CraftingDataSetter"
NewObject
Push 1 register1 "ItemList"
GetMember
Push "addDataProcessor"
CallMethod
Pop
Push register2 "Appearance"
GetMember
Push 1 "CraftingIconSetter"
NewObject
Push 1 register1 "ItemList"
GetMember
Push "addDataProcessor"
CallMethod
Pop
Push 0 register1 "positionFloatingElements"
CallMethod
Pop
Push register1 "CategoryList"
GetMember
Push "itemList"
GetMember
Push "listState"
GetMember
StoreRegister 3
Pop
Push register2 "Appearance"
GetMember
StoreRegister 4
Pop
Push register3 "iconSource" register4 "icons"
GetMember
Push "item"
GetMember
Push "source"
GetMember
SetMember
Push register3 "showStolenIcon" register4 "icons"
GetMember
Push "item"
GetMember
Push "showStolen"
GetMember
SetMember
Push register3 "defaultEnabledColor" register4 "colors"
GetMember
Push "text"
GetMember
Push "enabled"
GetMember
SetMember
Push register3 "negativeEnabledColor" register4 "colors"
GetMember
Push "negative"
GetMember
Push "enabled"
GetMember
SetMember
Push register3 "stolenEnabledColor" register4 "colors"
GetMember
Push "stolen"
GetMember
Push "enabled"
GetMember
SetMember
Push register3 "defaultDisabledColor" register4 "colors"
GetMember
Push "text"
GetMember
Push "disabled"
GetMember
SetMember
Push register3 "negativeDisabledColor" register4 "colors"
GetMember
Push "negative"
GetMember
Push "disabled"
GetMember
SetMember
Push register3 "stolenDisabledColor" register4 "colors"
GetMember
Push "stolen"
GetMember
Push "disabled"
GetMember
SetMember
Push undefined
StoreRegister 5
Pop
Push register1 "_subtypeName"
GetMember
Push "EnchantConstruct"
Equals2
Not
If loc2a56
Push "EnchantListLayout" register2 "ListLayout"
GetMember
Push 2 "skyui"
GetVariable
Push "components"
GetMember
Push "list"
GetMember
Push "ListLayoutManager"
GetMember
Push "createLayout"
CallMethod
StoreRegister 5
Pop
Jump loc2b62
loc2a56:Push register1 "_subtypeName"
GetMember
Push "Smithing"
Equals2
Not
If loc2aad
Push "SmithingListLayout" register2 "ListLayout"
GetMember
Push 2 "skyui"
GetVariable
Push "components"
GetMember
Push "list"
GetMember
Push "ListLayoutManager"
GetMember
Push "createLayout"
CallMethod
StoreRegister 5
Pop
Jump loc2b62
loc2aad:Push register1 "_subtypeName"
GetMember
Push "ConstructibleObject"
Equals2
Not
If loc2b04
Push "ConstructListLayout" register2 "ListLayout"
GetMember
Push 2 "skyui"
GetVariable
Push "components"
GetMember
Push "list"
GetMember
Push "ListLayoutManager"
GetMember
Push "createLayout"
CallMethod
StoreRegister 5
Pop
Jump loc2b62
loc2b04:Push "AlchemyListLayout" register2 "ListLayout"
GetMember
Push 2 "skyui"
GetVariable
Push "components"
GetMember
Push "list"
GetMember
Push "ListLayoutManager"
GetMember
Push "createLayout"
CallMethod
StoreRegister 5
Pop
Push register5 "entryWidth" register5 "entryWidth"
GetMember
Push "CraftingLists"
GetVariable
Push "SHORT_LIST_OFFSET"
GetMember
Subtract
SetMember
loc2b62:Push register5 1 register1 "ItemList"
GetMember
Push "__set__layout"
CallMethod
Pop
Push register2 "Input"
GetMember
Push "controls"
GetMember
Push "gamepad"
GetMember
Push "prevColumn"
GetMember
StoreRegister 6
Pop
Push register2 "Input"
GetMember
Push "controls"
GetMember
Push "gamepad"
GetMember
Push "nextColumn"
GetMember
StoreRegister 7
Pop
Push register2 "Input"
GetMember
Push "controls"
GetMember
Push "gamepad"
GetMember
Push "sortOrder"
GetMember
StoreRegister 8
Pop
Push register1 "_sortColumnControls" "keyCode" register7 1
InitObject
Push "keyCode" register6 1
InitObject
Push 2
InitArray
SetMember
Push register1 "_sortOrderControls" "keyCode" register8 1
InitObject
SetMember
Push register1 "_searchKey" register2 "Input"
GetMember
Push "controls"
GetMember
Push "pc"
GetMember
Push "search"
GetMember
SetMember
Push register1 "_searchControls" "keyCode" register1 "_searchKey"
GetMember
Push 1
InitObject
SetMember
}
SetMember
Push register2 "onItemListPressed"
DefineFunction2 "" 1 3 false false true false true false false true false 2 "event"  {
Push 0 register1 "ItemList"
GetMember
Push "__get__selectedIndex"
CallMethod
Push 1
InitArray
Push "CraftSelectedItem" 2 "gfx"
GetVariable
Push "io"
GetMember
Push "GameDelegate"
GetMember
Push "call"
CallMethod
Pop
Push 0 register1 "ItemList"
GetMember
Push "__get__selectedIndex"
CallMethod
Push 1
InitArray
Push "SetSelectedItem" 2 "gfx"
GetVariable
Push "io"
GetMember
Push "GameDelegate"
GetMember
Push "call"
CallMethod
Pop
}
SetMember
Push register2 "onItemSelect"
DefineFunction2 "" 1 3 false false true false true false false true false 2 "event"  {
Push register2 "index"
GetMember
Push 1
InitArray
Push "ChooseItem" 2 "gfx"
GetVariable
Push "io"
GetMember
Push "GameDelegate"
GetMember
Push "call"
CallMethod
Pop
Push register2 "index"
GetMember
Push -1
Equals2
Not
Push 1
InitArray
Push "ShowItem3D" 2 "gfx"
GetVariable
Push "io"
GetMember
Push "GameDelegate"
GetMember
Push "call"
CallMethod
Pop
Push 0 register1 "UpdateButtonText"
CallMethod
Pop
}
SetMember
Push register2 "onItemHighlightChange"
DefineFunction2 "" 1 3 false false true false true false false true false 2 "event"  {
Push register2 "index"
GetMember
Push 1 register1 "SetSelectedItem"
CallMethod
Pop
Push register2 "index"
GetMember
Push -1
Equals2
Push 1 register1 "FadeInfoCard"
CallMethod
Pop
Push 0 register1 "UpdateButtonText"
CallMethod
Pop
Push register2 "index"
GetMember
Push -1
Equals2
Not
Push 1
InitArray
Push "ShowItem3D" 2 "gfx"
GetVariable
Push "io"
GetMember
Push "GameDelegate"
GetMember
Push "call"
CallMethod
Pop
}
SetMember
Push register2 "onShowItemsList"
DefineFunction2 "" 1 3 false false true false true false false true false 2 "event"  {
Push register1 "_platform"
GetMember
Push 0
Equals2
Not
If loc2f28
Push 0 register1 "CategoryList"
GetMember
Push "CategoriesList"
GetMember
Push "__get__selectedIndex"
CallMethod
Push 1
InitArray
Push "SetSelectedCategory" 2 "gfx"
GetVariable
Push "io"
GetMember
Push "GameDelegate"
GetMember
Push "call"
CallMethod
Pop
loc2f28:Push register2 1 register1 "onItemHighlightChange"
CallMethod
Pop
}
SetMember
Push register2 "onHideItemsList"
DefineFunction2 "" 1 3 false false true false true false false true false 2 "event"  {
Push register2 "index"
GetMember
Push 1 register1 "SetSelectedItem"
CallMethod
Pop
Push true 1 register1 "FadeInfoCard"
CallMethod
Pop
Push 0 register1 "UpdateButtonText"
CallMethod
Pop
Push false 1
InitArray
Push "ShowItem3D" 2 "gfx"
GetVariable
Push "io"
GetMember
Push "GameDelegate"
GetMember
Push "call"
CallMethod
Pop
}
SetMember
Push register2 "onCategoryListChange"
DefineFunction2 "" 1 3 false false true false true false false true false 2 "event"  {
Push register1 "_platform"
GetMember
Push 0
Equals2
Not
Not
If loc3050
Push register2 "index"
GetMember
Push 1
InitArray
Push "SetSelectedCategory" 2 "gfx"
GetVariable
Push "io"
GetMember
Push "GameDelegate"
GetMember
Push "call"
CallMethod
Pop
}
loc3050:SetMember
Push register2 "onSliderChanged"
DefineFunction2 "" 1 3 false false true false true false false true false 2 "event"  {
Push "SetChargeValues" register1 register1 "ItemInfo"
GetMember
Push "quantitySlider"
GetMember
Push "value"
GetMember
Push 1
InitArray
Push "CalculateCharge" 4 "gfx"
GetVariable
Push "io"
GetMember
Push "GameDelegate"
GetMember
Push "call"
CallMethod
Pop
}
SetMember
Push register2 "onSubMenuAction"
DefineFunction2 "" 1 3 false false true false true false false true false 2 "event"  {
Push register2 "opening"
GetMember
Push true
Equals2
Not
If loc315a
Push register1 "ItemList"
GetMember
Push "disableSelection" true
SetMember
Push register1 "ItemList"
GetMember
Push "disableInput" true
SetMember
Push register1 "CategoryList"
GetMember
Push "CategoriesList"
GetMember
Push "disableSelection" true
SetMember
Push register1 "CategoryList"
GetMember
Push "CategoriesList"
GetMember
Push "disableInput" true
SetMember
Jump loc31d5
loc315a:Push register2 "opening"
GetMember
Push false
Equals2
Not
If loc31d5
Push register1 "ItemList"
GetMember
Push "disableSelection" false
SetMember
Push register1 "ItemList"
GetMember
Push "disableInput" false
SetMember
Push register1 "CategoryList"
GetMember
Push "CategoriesList"
GetMember
Push "disableSelection" false
SetMember
Push register1 "CategoryList"
GetMember
Push "CategoriesList"
GetMember
Push "disableInput" false
SetMember
loc31d5:Push register2 "menu"
GetMember
Push "quantity"
Equals2
Not
If loc324b
Push register2 "opening"
GetMember
Not
If loc3203
Push undefined
Return
loc3203:Push register2 "value"
GetMember
Push register2 "canceled"
GetMember
Not
Push 2
InitArray
Push "SliderClose" 2 "gfx"
GetVariable
Push "io"
GetMember
Push "GameDelegate"
GetMember
Push "call"
CallMethod
Pop
}
loc324b:SetMember
Push register2 "onCraftButtonPress"
DefineFunction2 "" 0 2 false false true false true false false true false  {
Push 0 register1 "__get__bCanCraft"
CallMethod
Not
If loc32ab
Push 0
InitArray
Push "CraftButtonPress" 2 "gfx"
GetVariable
Push "io"
GetMember
Push "GameDelegate"
GetMember
Push "call"
CallMethod
Pop
}
loc32ab:SetMember
Push register2 "onExitButtonPress"
DefineFunction "" 0  {
Push 0
InitArray
Push "CloseMenu" 2 "gfx"
GetVariable
Push "io"
GetMember
Push "GameDelegate"
GetMember
Push "call"
CallMethod
Pop
}
SetMember
Push register2 "onAuxButtonPress"
DefineFunction "" 0  {
Push 0
InitArray
Push "AuxButtonPress" 2 "gfx"
GetVariable
Push "io"
GetMember
Push "GameDelegate"
GetMember
Push "call"
CallMethod
Pop
}
SetMember
Push register2 "onEndEditItemName"
DefineFunction2 "" 1 3 false false true false true false false true false 2 "event"  {
Push 0 register1 "ItemInfo"
GetMember
Push "EndEditName"
CallMethod
Pop
Push register2 "newName"
GetMember
Push register2 "useNewName"
GetMember
Push 2
InitArray
Push "EndItemRename" 2 "gfx"
GetVariable
Push "io"
GetMember
Push "GameDelegate"
GetMember
Push "call"
CallMethod
Pop
}
SetMember
Push register2 "getItemShown"
DefineFunction2 "" 0 2 false false true false true false false true false  {
Push 0 register1 "ItemList"
GetMember
Push "__get__selectedIndex"
CallMethod
Push 0
Less2
Not
Return
}
SetMember
Push register2 "onMouseUp"
DefineFunction2 "" 0 3 false true true false true false false true false  {
Push register1 "ItemInfo"
GetMember
Push "bEditNameMode"
GetMember
PushDuplicate
Not
If loc3450
Pop
Push register2 "_ymouse"
GetMember
Push register2 "_xmouse"
GetMember
Push 2 register1 "ItemInfo"
GetMember
Push "hitTest"
CallMethod
Not
loc3450:Not
If loc3489
Push "useNewName" false "newName" "" 2
InitObject
Push 1 register1 "onEndEditItemName"
CallMethod
Pop
}
loc3489:SetMember
Push register2 "onMouseRotationStart"
DefineFunction2 "" 0 2 false false true false true false false true false  {
Push 0
InitArray
Push "StartMouseRotation" 2 "gfx"
GetVariable
Push "io"
GetMember
Push "GameDelegate"
GetMember
Push "call"
CallMethod
Pop
Push register1 "CategoryList"
GetMember
Push "CategoriesList"
GetMember
Push "disableSelection" true
SetMember
Push register1 "ItemList"
GetMember
Push "disableSelection" true
SetMember
}
SetMember
Push register2 "onMouseRotationStop"
DefineFunction2 "" 0 2 false false true false true false false true false  {
Push 0
InitArray
Push "StopMouseRotation" 2 "gfx"
GetVariable
Push "io"
GetMember
Push "GameDelegate"
GetMember
Push "call"
CallMethod
Pop
Push register1 "CategoryList"
GetMember
Push "CategoriesList"
GetMember
Push "disableSelection" false
SetMember
Push register1 "ItemList"
GetMember
Push "disableSelection" false
SetMember
}
SetMember
Push register2 "onItemsListInputCatcherClick"
DefineFunction "" 0  {
}
SetMember
Push register2 "onMouseRotationFastClick"
DefineFunction2 "" 1 3 false false true false true false false true false 2 "aiMouseButton"  {
Push register2 0
Equals2
Not
If loc35de
Push 0 register1 "onItemsListInputCatcherClick"
CallMethod
Pop
}
loc35de:SetMember
Push register1 "CraftingMenuInstance" null
SetMember
Push register1 "SKYUI_RELEASE_IDX" 2018
SetMember
Push register1 "SKYUI_VERSION_MAJOR" 5
SetMember
Push register1 "SKYUI_VERSION_MINOR" 2
SetMember
Push register1 "SKYUI_VERSION_STRING" "CraftingMenu"
GetVariable
Push "SKYUI_VERSION_MAJOR"
GetMember
Push "."
Add2
Push "CraftingMenu"
GetVariable
Push "SKYUI_VERSION_MINOR"
GetMember
Add2
Push " SE"
Add2
SetMember
Push register1 "LIST_OFFSET" 20
SetMember
Push register1 "SELECT_BUTTON" 0
SetMember
Push register1 "EXIT_BUTTON" 1
SetMember
Push register1 "AUX_BUTTON" 2
SetMember
Push register1 "CRAFT_BUTTON" 3
SetMember
Push register1 "SUBTYPE_NAMES" "Alchemy" "EnchantDestruct" "EnchantConstruct" "Smithing" "ConstructibleObject" 5
InitArray
SetMember
Push register2 "_bCanCraft" false
SetMember
Push register2 "_bCanFadeItemInfo" true
SetMember
Push register2 "_bItemCardAdditionalDescription" false
SetMember
Push register2 "_platform" 0
SetMember
Push register2 "currentMenuType" ""
SetMember
Push register2 "dbgIntvl" 0
SetMember
Push 1 null "CraftingMenu"
GetVariable
Push "prototype"
GetMember
Push 3 "ASSetPropFlags"
CallFunction
loc377d:Pop
