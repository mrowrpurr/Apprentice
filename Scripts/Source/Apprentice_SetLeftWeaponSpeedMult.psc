Scriptname Apprentice_SetLeftWeaponSpeedMult extends ActiveMagicEffect  
{Sets the left weapon speed to be slow for untrained players}

float LeftWeaponSpeedMult
float RightWeaponSpeedMult

event OnEffectStart(Actor target, Actor caster)
    LeftWeaponSpeedMult = GetTargetActor().GetActorValue("LeftWeaponSpeedMult")
    RightWeaponSpeedMult = GetTargetActor().GetActorValue("WeaponSpeedMult")
    RegisterForUpdate(0.5)
endEvent

event OnUpdate()
    float low = Utility.RandomFloat(0.3, 0.7)
    float high = Utility.RandomFloat(1.6, 2.0)
    float speedMult
    if Utility.RandomInt(1, 100) < 65
        speedMult = low
    else
        speedMult = high
    endIf
    GetTargetActor().SetActorValue("LeftWeaponSpeedMult", speedMult)

    low = Utility.RandomFloat(0.3, 0.7)
    high = Utility.RandomFloat(1.6, 2.0)
    speedMult
    if Utility.RandomInt(1, 100) < 65
        speedMult = low
    else
        speedMult = high
    endIf
    GetTargetActor().SetActorValue("WeaponSpeedMult", speedMult)
endEvent

event OnEffectFinish(Actor target, Actor caster)
    UnregisterForUpdate()
    GetTargetActor().SetActorValue("LeftWeaponSpeedMult", LeftWeaponSpeedMult)
    GetTargetActor().SetActorValue("WeaponSpeedMult", RightWeaponSpeedMult)
endEvent