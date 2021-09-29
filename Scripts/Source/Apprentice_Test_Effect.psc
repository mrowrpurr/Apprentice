scriptName Apprentice_Test_Effect extends ActiveMagicEffect  

float CurrentAlpha

event OnEffectStart(Actor target, Actor caster)
    RegisterForUpdate(1.0)
    CurrentAlpha = UI.GetFloat("HUD Menu", "_root.HUDMovieBaseInstance.CrosshairInstance._alpha")
    UI.SetFloat("HUD Menu", "_root.HUDMovieBaseInstance.CrosshairInstance._alpha", 0.0)
endEvent

event OnEffectFinish(Actor target, Actor caster)
    UnregisterForUpdate()
    UI.SetFloat("HUD Menu", "_root.HUDMovieBaseInstance.CrosshairInstance._alpha", CurrentAlpha)
endEvent

event OnUpdate()
    Debug.Notification("Attacking!")
    Game.ShakeCamera(afStrength = 0.1)
    Game.GetPlayer().SetActorValue("Stamina", 0.0)
endEvent