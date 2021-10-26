scriptName ApprenticeMCM_ItemSpellAllowlist hidden

string function PageName() global
    return "Spells/Items Allowlist"
endFunction

function Render(ApprenticeMCM mcm, string page) global
    if page == PageName()
        mcm.SetCursorFillMode(mcm.TOP_TO_BOTTOM)
        LeftColumn(mcm)
        mcm.SetCursorPosition(1)
        RightColumn(mcm)
    endIf
endFunction

function LeftColumn(ApprenticeMCM mcm) global
    mcm.AllowlistSpellOptionIds = new int[1]
    mcm.AddHeaderOption("Allowed Spells")
    mcm.oid_Allowlist_Spells_Menu = mcm.AddMenuOption("Select Player Spell", "CHOOSE SPELL")
    Form[] allowedSpells = mcm.GetPlayerScript().AllowedSpells
    if allowedSpells
        int i = 0
        while i < allowedSpells.Length
            int optionId = mcm.AddTextOption(allowedSpells[i].GetName(), "")
            if mcm.AllowlistSpellOptionIds && mcm.AllowlistSpellOptionIds[0]
                mcm.AllowlistSpellOptionIds = Utility.ResizeIntArray(mcm.AllowlistSpellOptionIds, mcm.AllowlistSpellOptionIds.Length + 1)
            endIf
            mcm.AllowlistSpellOptionIds[i] = optionId
            i += 1
        endWhile
    endIf

    mcm.AllowlistTextFiltersOptionIds = new int[1]
    mcm.AddEmptyOption()
    mcm.AddHeaderOption("Allowed Item and Spell Name Filters")
    mcm.oid_Allowlist_Names_Input = mcm.AddInputOption("Allowed Filter:", "INPUT TEXT")
    string[] allowedTexts = mcm.GetPlayerScript().AllowedNames
    if allowedTexts
        int i = 0
        while i < allowedTexts.Length
            int optionId = mcm.AddTextOption(allowedTexts[i], "")
            if mcm.AllowlistTextFiltersOptionIds && mcm.AllowlistTextFiltersOptionIds[0]
                mcm.AllowlistTextFiltersOptionIds = Utility.ResizeIntArray(mcm.AllowlistTextFiltersOptionIds, mcm.AllowlistTextFiltersOptionIds.Length + 1)
            endIf
            mcm.AllowlistTextFiltersOptionIds[i] = optionId
            i += 1
        endWhile
    endIf
endFunction

function RightColumn(ApprenticeMCM mcm) global
    mcm.AllowlistItemOptionIds = new int[1]
    mcm.AddHeaderOption("Allowed items")
    mcm.oid_Allowlist_Items_Menu = mcm.AddMenuOption("Select Item from Inventory", "SELECT ITEM")
    Form[] allowedItems = mcm.GetPlayerScript().AllowedItems
    if allowedItems
        int i = 0
        while i < allowedItems.Length
            int optionId = mcm.AddTextOption(allowedItems[i].GetName(), "")
            if mcm.AllowlistItemOptionIds && mcm.AllowlistItemOptionIds[0]
                mcm.AllowlistItemOptionIds = Utility.ResizeIntArray(mcm.AllowlistItemOptionIds, mcm.AllowlistItemOptionIds.Length + 1)
            endIf
            mcm.AllowlistItemOptionIds[i] = optionId
            i += 1
        endWhile
    endIf
endFunction

function OnOptionHighlight(ApprenticeMCM mcm, int optionId) global
    if optionId == mcm.oid_Allowlist_Items_Menu
        mcm.SetInfoText("Choose an item from your inventory to mark as always allowed, regardless of whether you are trained in the required skill(s).")
    elseIf optionId == mcm.oid_Allowlist_Spells_Menu
        mcm.SetInfoText("Choose a spell you know to mark as always allowed, regardless of whether you are trained in the required skill(s).")
    endIf
endFunction

function OnOptionMenuOpen(ApprenticeMCM mcm, int optionId) global
    if optionId == mcm.oid_Allowlist_Items_Menu
        mcm.SetMenuDialogOptions(mcm.GetPlayerInventoryItemNamesNotAlreadyOnAllowlist())
    elseIf optionId == mcm.oid_Allowlist_Spells_Menu
        mcm.SetMenuDialogOptions(mcm.GetPlayerSpellNamesNotAlreadyOnAllowlist())
    endIf
endFunction

function OnOptionMenuAccept(ApprenticeMCM mcm, int optionId, int index) global
    if index == -1
        return
    endIf
    if optionId == mcm.oid_Allowlist_Items_Menu
        mcm.GetPlayerScript().AddAllowedItem(mcm.Allowlist_Items_Cache[index])
        mcm.ForcePageReset()
    elseIf optionId == mcm.oid_Allowlist_Spells_Menu
        mcm.GetPlayerScript().AddAllowedSpell(mcm.Allowlist_Spells_Cache[index])
        mcm.ForcePageReset()
    endIf
endFunction

function OnOptionInputAccept(ApprenticeMCM mcm, int optionId, string text) global
    if optionId == mcm.oid_Allowlist_Names_Input
        mcm.GetPlayerScript().AddAllowedFilter(text)
        mcm.ForcePageReset()
    endIf
endFunction

function OnOptionSelect(ApprenticeMCM mcm, int optionId) global
    int foundOptionIdIndex = mcm.AllowlistTextFiltersOptionIds.Find(optionId)
    if foundOptionIdIndex > -1
        string text = mcm.GetPlayerScript().AllowedNames[foundOptionIdIndex]
        if mcm.ShowMessage("Are you sure you want to remove the allowed item/spell filter '" + text + "'?")
            mcm.GetPlayerScript().RemoveAllowedFilter(text)
            mcm.ForcePageReset()
        endIf
    else
        foundOptionIdIndex = mcm.AllowlistSpellOptionIds.Find(optionId)
        if foundOptionIdIndex > -1
            Form theSpell = mcm.GetPlayerScript().AllowedSpells[foundOptionIdIndex]
            if mcm.ShowMessage("Are you sure you want to remove the allowed spell '" + theSpell.GetName() + "'?")
                mcm.GetPlayerScript().RemoveAllowedSpell(theSpell)
                mcm.ForcePageReset()
            endIf
        else
            foundOptionIdIndex = mcm.AllowlistItemOptionIds.Find(optionId)
            if foundOptionIdIndex > -1
                Form theItem = mcm.GetPlayerScript().AllowedItems[foundOptionIdIndex]
                if mcm.ShowMessage("Are you sure you want to remove the allowed item '" + theItem.GetName() + "'?")
                    mcm.GetPlayerScript().RemoveAllowedItem(theItem)
                    mcm.ForcePageReset()
                endIf
            endIf
        endIf
    endIf
endFunction
