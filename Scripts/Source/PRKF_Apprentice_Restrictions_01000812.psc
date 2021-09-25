;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 12
Scriptname PRKF_Apprentice_Restrictions_01000812 Extends Perk Hidden

;BEGIN FRAGMENT Fragment_6
Function Fragment_6(ObjectReference akTargetRef, Actor akActor)
;BEGIN CODE
Debug.MessageBox("You are not trained in Alchemy")
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_10
Function Fragment_10(ObjectReference akTargetRef, Actor akActor)
;BEGIN CODE
Debug.MessageBox("You are not trained in Smithing")
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_8
Function Fragment_8(ObjectReference akTargetRef, Actor akActor)
;BEGIN CODE
Debug.MessageBox("You are not trained in Enchanting")
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_0
Function Fragment_0(ObjectReference akTargetRef, Actor akActor)
;BEGIN CODE
Debug.MessageBox("You are not trained in Lockpicking")
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_5
Function Fragment_5(ObjectReference akTargetRef, Actor akActor)
;BEGIN CODE
Debug.MessageBox("You are not trained in Pickpocket")
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment
