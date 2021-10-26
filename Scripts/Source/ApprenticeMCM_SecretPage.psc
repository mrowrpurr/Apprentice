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
    mcm.oid_Secret_MenuPasswordRequired       = mcm.AddToggleOption("Secret Password Required", mcm.Apprentice_Secret_MenuPasswordRequired.Value > 0, mcm.LockableOptionFlag)
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
    elseIf optionId == mcm.oid_Secret_MenuPasswordRequired
        mcm.SetInfoText("Toggle if secret menu requires a secret password to activate (see Apprentice on Nexus for clues on the password). If you lock the Apprentice menu, this option will be locked! Default: true")
    endIf
endFunction

function OnOptionSelect(ApprenticeMCM mcm, int optionId) global
    if optionId == mcm.oid_Secret_MenuKeyboardShortcut_Alt
        if mcm.Apprentice_Secret_MenuKeyboardShortcut_Alt.Value > 0
            mcm.Apprentice_Secret_MenuKeyboardShortcut_Alt.Value = 0
            mcm.SetToggleOptionValue(optionId, false)
        else
            mcm.Apprentice_Secret_MenuKeyboardShortcut_Alt.Value = 1
            mcm.SetToggleOptionValue(optionId, true)
        endIf
    elseIf optionId == mcm.oid_Secret_MenuKeyboardShortcut_Ctrl
        if mcm.Apprentice_Secret_MenuKeyboardShortcut_Ctrl.Value > 0
            mcm.Apprentice_Secret_MenuKeyboardShortcut_Ctrl.Value = 0
            mcm.SetToggleOptionValue(optionId, false)
        else
            mcm.Apprentice_Secret_MenuKeyboardShortcut_Ctrl.Value = 1
            mcm.SetToggleOptionValue(optionId, true)
        endIf
    elseIf optionId == mcm.oid_Secret_MenuKeyboardShortcut_Shift
        if mcm.Apprentice_Secret_MenuKeyboardShortcut_Shift.Value > 0
            mcm.Apprentice_Secret_MenuKeyboardShortcut_Shift.Value = 0
            mcm.SetToggleOptionValue(optionId, false)
        else
            mcm.Apprentice_Secret_MenuKeyboardShortcut_Shift.Value = 1
            mcm.SetToggleOptionValue(optionId, true)
        endIf
    elseIf optionId == mcm.oid_Secret_MenuPasswordRequired
        if mcm.Apprentice_Secret_MenuPasswordRequired.Value > 0
            mcm.Apprentice_Secret_MenuPasswordRequired.Value = 0
            mcm.SetToggleOptionValue(optionId, false)
        else
            mcm.Apprentice_Secret_MenuPasswordRequired.Value = 1
            mcm.SetToggleOptionValue(optionId, true)
        endIf
    endIf
endFunction

function OnOptionKeyMapChange(ApprenticeMCM mcm, int optionId, int keyCode, string conflictControl, string conflictName) global
    ApprenticePlayer playerScript = (mcm as Quest).GetAliasByName("PlayerRef") as ApprenticePlayer
    playerScript.UnregisterForKey(mcm.Apprentice_Secret_MenuKeyboardShortcut_Key.Value as int)
    mcm.Apprentice_Secret_MenuKeyboardShortcut_Key.Value = keyCode
    mcm.SetKeyMapOptionValue(optionId, keyCode)
    playerScript.RegisterForKey(keyCode)
endFunction
