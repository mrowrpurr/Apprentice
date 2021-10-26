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
    mcm.AddKeyMapOption("Keyboard Shortcut to open Secret Menu", 31)
endFunction
