scriptName Apprentice_UntrainedBowEffect extends ActiveMagicEffect  
{All of the effects when the player is untrained in Archery AND they are actively attacking}

; TODO - Add a chance of being hit by your own arrow!

; TODO Power Attacks have a high change of player stagger
;      and they have a higher chance of player hurting themselves

; TODO If your attack is blocked, you take extra damage.

; Once you gain a certain amount of skill levels in a skill,
; THEN YOU UNLOCK THAT SKILL AND YOU BECOME TRAINED

; TODO - Second Effect for Stamina...

Spell property Apprentice_StaggerSpell auto

float CurrentArrowTiltOffset = 2.0
float f1PArrowTiltUpAngle
float CameraShakeStrength = 0.1
float StartingStamina

event OnEffectStart(Actor target, Actor caster)
    Weapon leftHand = GetTargetActor().GetEquippedWeapon(abLeftHand = true)
    Weapon rightHand = GetTargetActor().GetEquippedWeapon(abLeftHand = false)
    if (leftHand && leftHand.GetSkill() == "Marksman") || (rightHand && rightHand.GetSkill() == "Marksman")
        UI.SetFloat("HUD Menu", "_root.HUDMovieBaseInstance.CrosshairInstance._alpha", 0.0)
        RegisterForUpdate(0.8)
        StartingStamina = GetTargetActor().GetActorValue("Stamina")
        f1PArrowTiltUpAngle = Utility.GetINIFloat("f1PArrowTiltUpAngle:Combat")
    else
        if Utility.RandomInt(1, 100) < 20
            Apprentice_StaggerSpell.Cast(GetTargetActor(), GetTargetActor())
        endIf
    endIf
endEvent

event OnUpdate()
    GetTargetActor().SetActorValue("Stamina", 0.0)
    Game.ShakeCamera(afStrength = CameraShakeStrength)
    float newTiltUpAngle = f1PArrowTiltUpAngle + Utility.RandomFloat(-CurrentArrowTiltOffset, CurrentArrowTiltOffset)
    Utility.SetINIFloat("f1PArrowTiltUpAngle:Combat", newTiltUpAngle)
    CameraShakeStrength += 0.1
    CurrentArrowTiltOffset += 3.0
endEvent

event OnEffectFinish(Actor target, Actor caster)
    UnregisterForUpdate()
    UI.SetFloat("HUD Menu", "_root.HUDMovieBaseInstance.CrosshairInstance._alpha", 1.0)
    Utility.SetINIFloat("f1PArrowTiltUpAngle:Combat", f1PArrowTiltUpAngle)
endEvent
