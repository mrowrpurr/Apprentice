scriptName Apprentice_UntrainedSneakEffect extends ActiveMagicEffect  

float StealthMeter

; Start Sneaking
event OnEffectStart(Actor target, Actor caster)
    ; StealthMeter = UI.GetFloat("HUD Menu", "_root.HUDMovieBaseInstance.StealthMeterInstance._alpha")
    ; UI.SetFloat("HUD Menu", "_root.HUDMovieBaseInstance.StealthMeterInstance._alpha", 0.0)
endEvent

; Stop Sneaking
event OnEffectFinish(Actor target, Actor caster)
    ; UI.SetFloat("HUD Menu", "_root.HUDMovieBaseInstance.StealthMeterInstance._alpha", StealthMeter)
endEvent
