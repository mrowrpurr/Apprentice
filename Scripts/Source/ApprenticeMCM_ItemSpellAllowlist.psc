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
    mcm.AddHeaderOption("Allowed Spells")
    mcm.oid_Allowlist_Spells_Menu = mcm.AddMenuOption("Select Player Spell", "CHOOSE SPELL")
    Form[] allowedSpells = mcm.GetPlayerScript().AllowedSpells
    if allowedSpells
        int i = 0
        while i < allowedSpells.Length
            mcm.AddTextOption(allowedSpells[i].GetName(), "")
            i += 1
        endWhile
    endIf
endFunction

function RightColumn(ApprenticeMCM mcm) global
    mcm.AddHeaderOption("Allowed items")
    mcm.oid_Allowlist_Items_Menu = mcm.AddMenuOption("Select Item from Inventory", "SELECT ITEM")
    Form[] allowedItems = mcm.GetPlayerScript().AllowedItems
    if allowedItems
        int i = 0
        while i < allowedItems.Length
            mcm.AddTextOption(allowedItems[i].GetName(), "")
            i += 1
        endWhile
    endIf
endFunction

function OnOptionHighlight(ApprenticeMCM mcm, int optionId) global
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
        ; TODO maybe add the item properly :)
        ; which will involve moving the MCM cursor to the right spot
    elseIf optionId == mcm.oid_Allowlist_Spells_Menu
        mcm.GetPlayerScript().AddAllowedSpell(mcm.Allowlist_Spells_Cache[index])
        mcm.ForcePageReset()
        ; TODO maybe add the spell properly :)
        ; which will involve moving the MCM cursor to the right spot
    endIf
endFunction
