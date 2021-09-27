;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 2
Scriptname PRKF_Apprentice_Restrictions_010022EB Extends Perk Hidden

;BEGIN FRAGMENT Fragment_0
Function Fragment_0(ObjectReference akTargetRef, Actor akActor)
;BEGIN CODE
Key theKey = akTargetRef.GetKey()
if theKey
    if akActor.GetItemCount(theKey) > 0
        akTargetRef.Lock(abLock = false)
        akTargetRef.Activate(akActor)
        return
    endIf
endIf
Debug.MessageBox("You are not trained in Lockpicking.\n\nYou need to be trained in Lockpicking before you can attempt to pick a lock.")
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_2
Function Fragment_2(ObjectReference akTargetRef, Actor akActor)
;BEGIN CODE
Debug.MessageBox("You are not trained in Pickpocket.\n\nYou need to be trained in Pickpocket before you can attempt to pickpocket.")
;END CODE
EndFunction
;END FRAGMENT


;END FRAGMENT CODE - Do not edit anything between this and the begin comment