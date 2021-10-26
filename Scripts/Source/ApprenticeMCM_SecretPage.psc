scriptName ApprenticeMCM_SecretPage hidden

string function PageName() global
    return " "
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
endFunction

function RightColumn(ApprenticeMCM mcm) global
    mcm.AddHeaderOption("Secret Menu")
    mcm.oid_Secret_MenuKeyboardShortcut_Key   = mcm.AddKeyMapOption("Keyboard Shortcut to open Secret Menu", mcm.Apprentice_Secret_MenuKeyboardShortcut_Key.Value as int)
    mcm.oid_Secret_MenuKeyboardShortcut_Alt   = mcm.AddToggleOption("Alt", mcm.Apprentice_Secret_MenuKeyboardShortcut_Alt.Value == 1)
    mcm.oid_Secret_MenuKeyboardShortcut_Ctrl  = mcm.AddToggleOption("Ctrl", mcm.Apprentice_Secret_MenuKeyboardShortcut_Ctrl.Value == 1)
    mcm.oid_Secret_MenuKeyboardShortcut_Shift = mcm.AddToggleOption("Shift", mcm.Apprentice_Secret_MenuKeyboardShortcut_Shift.Value == 1)
endFunction

function OnOptionHighlight(ApprenticeMCM mcm, int optionId) global
    if optionId == mcm.oid_Secret_MenuKeyboardShortcut_Key
        mcm.SetInfoText("Keyboard shortcut which opens the Secret Menu")
    elseIf optionId == mcm.oid_Secret_MenuKeyboardShortcut_Alt
        mcm.SetInfoText("Alt-key binding for Secret Menu keyboard shortcut")
    elseIf optionId == mcm.oid_Secret_MenuKeyboardShortcut_Ctrl
        mcm.SetInfoText("Ctrl-key binding for Secret Menu keyboard shortcut")
    elseIf optionId == mcm.oid_Secret_MenuKeyboardShortcut_Shift
        mcm.SetInfoText("Shift-key binding for Secret Menu keyboard shortcut")
    endIf
endFunction

function OnOptionSelect(ApprenticeMCM mcm, int optionId) global
    GlobalVariable theVariable
    if optionId == mcm.oid_Secret_MenuKeyboardShortcut_Alt
        theVariable = mcm.Apprentice_Secret_MenuKeyboardShortcut_Alt
    elseIf optionId == mcm.oid_Secret_MenuKeyboardShortcut_Ctrl
        theVariable = mcm.Apprentice_Secret_MenuKeyboardShortcut_Ctrl
    elseIf optionId == mcm.oid_Secret_MenuKeyboardShortcut_Shift
        theVariable = mcm.Apprentice_Secret_MenuKeyboardShortcut_Shift
    endIf
    if theVariable.Value > 0
        theVariable.Value = 0
        mcm.SetToggleOptionValue(optionId, false)
    else
        theVariable.Value = 1
        mcm.SetToggleOptionValue(optionId, true)
    endIf
endFunction

function OnOptionKeyMapChange(ApprenticeMCM mcm, int optionId, int keyCode, string conflictControl, string conflictName) global
    ApprenticePlayer playerScript = (mcm as Quest).GetAliasByName("PlayerRef") as ApprenticePlayer
    playerScript.UnregisterForKey(mcm.Apprentice_Secret_MenuKeyboardShortcut_Key.Value as int)
    mcm.Apprentice_Secret_MenuKeyboardShortcut_Key.Value = keyCode
    mcm.SetKeyMapOptionValue(optionId, keyCode)
    playerScript.RegisterForKey(keyCode)
endFunction
