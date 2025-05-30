;-| Button Remapping |-----------------------------------------------------
; This section lets you remap the player's buttons (to easily change the
; button configuration). The format is:
;   old_button = new_button
; If new_button is left blank, the button cannot be pressed.
[Remap]
x = x
y = y
z = z
a = a
b = b
c = c
s = s

;-| Default Values |-------------------------------------------------------
[Defaults]
; Default value for the "time" parameter of a Command. Minimum 1.
command.time = 30

; Default value for the "buffer.time" parameter of a Command. Minimum 1,
; maximum 30.
command.buffer.time = 1

;-| Super Motions |--------------------------------------------------------


;-| Special Motions |------------------------------------------------------

[Command]
name = "GRAB"
command = x+a
time = 20

[Command]
name = "NANNA_1"
command = ~D, DF, F, x
time = 20

[Command]
name = "NANNA_1"
command = ~D, DF, F, y
time = 20


[Command]
name = "NANNA_2"
command = ~D, DF, F, z
time = 20

[Command]
name = "NANNAGND_1"
command = ~D, DF, F, a
time = 20

[Command]
name = "POGORIDE1"
command = ~D, D, a
time = 20

[Command]
name = "POGORIDE2_FWD"
command = ~D, D, b
time = 20

[Command]
name = "POGORIDE3"
command = ~D, D, c
time = 20

[Command]
name = "POGO"
command = ~D, DF, F, a+b
time = 20

[Command]
name = "POGO"
command = ~D, DF, F, b+c
time = 20

[Command]
name = "POGO"
command = ~D, DF, F, a+c
time = 20


;-| Double Tap |-----------------------------------------------------------
[Command]
name = "FF"     ;Required (do not remove)
command = F, F
time = 10

[Command]
name = "BB"     ;Required (do not remove)
command = B, B
time = 10

;-| 2/3 Button Combination |-----------------------------------------------
[Command]
name = "recovery" ;Required (do not remove)
command = x+y
time = 1

[Command]
name = "recovery"
command = y+z
time = 1

[Command]
name = "recovery"
command = x+z
time = 1

[Command]
name = "recovery"
command = a+b
time = 1

[Command]
name = "recovery"
command = b+c
time = 1

[Command]
name = "recovery"
command = a+c
time = 1

;-| Dir + Button |---------------------------------------------------------
[Command]
name = "back_x"
command = /$B,x
time = 1

[Command]
name = "back_y"
command = /$B,y
time = 1

[Command]
name = "back_z"
command = /$B,z
time = 1

[Command]
name = "down_x"
command = /$D,x
time = 1

[Command]
name = "down_y"
command = /$D,y
time = 1

[Command]
name = "down_z"
command = /$D,z
time = 1

[Command]
name = "fwd_x"
command = /$F,x
time = 1

[Command]
name = "fwd_y"
command = /$F,y
time = 1

[Command]
name = "fwd_z"
command = /$F,z
time = 1

[Command]
name = "up_x"
command = /$U,x
time = 1

[Command]
name = "up_y"
command = /$U,y
time = 1

[Command]
name = "up_z"
command = /$U,z
time = 1

[Command]
name = "back_a"
command = /$B,a
time = 1

[Command]
name = "back_b"
command = /$B,b
time = 1

[Command]
name = "back_c"
command = /$B,c
time = 1

[Command]
name = "down_a"
command = /$D,a
time = 1

[Command]
name = "down_b"
command = /$D,b
time = 1

[Command]
name = "down_c"
command = /$D,c
time = 1

[Command]
name = "fwd_a"
command = /$F,a
time = 1

[Command]
name = "fwd_b"
command = /$F,b
time = 1

[Command]
name = "fwd_c"
command = /$F,c
time = 1

[Command]
name = "up_a"
command = /$U,a
time = 1

[Command]
name = "up_b"
command = /$U,b
time = 1

[Command]
name = "up_c"
command = /$U,c
time = 1

;-| Single Button |---------------------------------------------------------
[Command]
name = "a"
command = a
time = 1

[Command]
name = "b"
command = b
time = 1

[Command]
name = "c"
command = c
time = 1

[Command]
name = "x"
command = x
time = 1

[Command]
name = "y"
command = y
time = 1

[Command]
name = "z"
command = z
time = 1

[Command]
name = "s"
command = s
time = 1

;-| Single Dir |------------------------------------------------------------
[Command]
name = "fwd" ;Required (do not remove)
command = $F
time = 1

[Command]
name = "downfwd"
command = $DF
time = 1

[Command]
name = "down" ;Required (do not remove)
command = $D
time = 1

[Command]
name = "downback"
command = $DB
time = 1

[Command]
name = "back" ;Required (do not remove)
command = $B
time = 1

[Command]
name = "upback"
command = $UB
time = 1

[Command]
name = "up" ;Required (do not remove)
command = $U
time = 1

[Command]
name = "upfwd"
command = $UF
time = 1

;-| Hold Button |--------------------------------------------------------------
[Command]
name = "hold_x"
command = /x
time = 1

[Command]
name = "hold_y"
command = /y
time = 1

[Command]
name = "hold_z"
command = /z
time = 1

[Command]
name = "hold_a"
command = /a
time = 1

[Command]
name = "hold_b"
command = /b
time = 1

[Command]
name = "hold_c"
command = /c
time = 1

[Command]
name = "hold_s"
command = /s
time = 1

;-| Hold Dir |--------------------------------------------------------------
[Command]
name = "holdfwd" ;Required (do not remove)
command = /$F
time = 1

[Command]
name = "holddownfwd"
command = /$DF
time = 1

[Command]
name = "holddown" ;Required (do not remove)
command = /$D
time = 1

[Command]
name = "holddownback"
command = /$DB
time = 1

[Command]
name = "holdback" ;Required (do not remove)
command = /$B
time = 1

[Command]
name = "holdupback"
command = /$UB
time = 1

[Command]
name = "holdup" ;Required (do not remove)
command = /$U
time = 1

[Command]
name = "holdupfwd"
command = /$UF
time = 1

;---------------------------------------------------------------------------

[Statedef -1]

;---------------------------------------------------------------------------

[State -1, AI Activation]
type = varset
triggerall = AILevel > 1
triggerall = (roundstate = 2) && (var(59) = 0)
trigger1 = Random <= ((AILevel-2)*100)
v = 59
value = 1

[State -1, AI Deactivation]
type = varset
triggerall = AIlevel < 8
triggerall = var(59) = 1
trigger1 = Random > ((AILevel-2)*100)
trigger2 = roundstate != 2
v = 59
value = 0

[State -1]
Type=VarSet
Trigger1=1
var(59)=(AILevel=1)*3+(AILevel=2)*7+(AILevel=3)*16+(AILevel=4)*30+(AILevel=5)*58+(AILevel=6)*90+ (AILevel=7)*150+(AILevel=8)*300


;===========================================================================
;---------------------------------------------------------------------------
; Run Fwd
[State -1, Run Fwd]
type = ChangeState
value = 100
trigger1 = command = "FF"
trigger1 = statetype = S
trigger1 = ctrl

;---------------------------------------------------------------------------
; Run Back
[State -1, Run Back]
type = ChangeState
value = 104
trigger1 = command = "BB"
trigger1 = statetype = S
trigger1 = ctrl

;==========================================================================

[State -1, Ground Dash/Evade]
type = ChangeState
value = 105
triggerall = (Command = "FF")
trigger1 = (StateType = A) && (Ctrl)
trigger2 = ((StateNo = 150) || (StateNo = 152)) && (Power >= 0000) ;Add this new trigger!

[State -1, Ground Dash/Evade]
type = ChangeState
value = 106
triggerall = (Command = "BB")
trigger1 = (StateType = A) && (Ctrl)
trigger2 = ((StateNo = 150) || (StateNo = 152)) && (Power >= 0000) ;Add this new trigger!

;==========================================================================


;---------------------------------------------------------------------------
; Taunt
[State -1, Taunt]
type = ChangeState
value = 195
triggerall = command = "s"
triggerall = numhelper(710) = 0
triggerall = command != "holddown"
trigger1 = statetype = S
trigger1 = ctrl

;---------------------------------------------------------------------------
; Stand Light Punch
[State -1, s.LP_a - Hammer Smack]
type = ChangeState
value = 200
triggerall = command = "x"
triggerall = command != "NANNA_1"
triggerall = command != "POGO"
triggerall = command != "GRAB"
triggerall = command != "holddown"
triggerall = pos Y = 0
trigger1 = statetype = S
trigger1 = ctrl

[State -3, 0]
type = ChangeState
triggerall = movecontact
triggerall = command = "x"
triggerall = command != "NANNA_1"
triggerall = command != "POGO"
triggerall = command != "GRAB"
triggerall = command != "holddown"
trigger1 = stateno = 200 && movecontact
trigger2 = stateno = 230 && movecontact
value = 201

;---------------------------------------------------------------------------
; Stand Medium Punch
[State -1, s.MP - Sledgehammer]
type = ChangeState
value = 210
triggerall = command = "y"
triggerall = command != "NANNA_1"
triggerall = command != "POGO"
triggerall = command != "holddown"
trigger1 = statetype = S
trigger1 = ctrl
trigger2 = stateno = 200 && movecontact
trigger3 = stateno = 201 && movecontact
trigger4 = stateno = 230 && movecontact
trigger5 = stateno = 231 && movecontact
trigger6 = stateno = 400 && movecontact
trigger7 = stateno = 401 && movecontact

;---------------------------------------------------------------------------
; Stand Hard Punch
[State -1, s.HP - Pogohammer]
type = ChangeState
value = 220
triggerall = command = "z"
triggerall = command != "NANNA_2"
triggerall = command != "POGO"
triggerall = command != "holddown"
trigger1 = statetype = S
trigger1 = ctrl
trigger2 = stateno = 240 && movecontact
trigger3 = stateno = 430 && movehit

;---------------------------------------------------------------------------
; Stand Light Kick
[State -1, s.LK - Hammer Upward Smack]
type = ChangeState
value = 230
triggerall = command = "a"
triggerall = command != "POGORIDE1"
triggerall = command != "POGO"
triggerall = command != "GRAB"
triggerall = command != "holddown"
trigger1 = statetype = S
trigger1 = ctrl

[State -3, 0]
type = ChangeState
triggerall = movecontact
triggerall = command = "a"
triggerall = command != "GRAB"
triggerall = command != "POGO"
triggerall = command != "holddown"
trigger1 = stateno = 230 && movecontact
trigger2 = stateno = 200 && movecontact
value = 231

;---------------------------------------------------------------------------
; Stand Light Punch
[State -1, s.MK - Sledge Jab]
type = ChangeState
value = 240
triggerall = command = "b"
triggerall = command != "POGO"
triggerall = command != "POGORIDE2_FWD"
triggerall = command != "holddown"
triggerall = pos Y = 0
trigger1 = statetype = S
trigger1 = ctrl
trigger2 = stateno = 200 && movecontact
trigger3 = stateno = 201 && movecontact
trigger4 = stateno = 230 && movecontact
trigger5 = stateno = 231 && movecontact
trigger6 = stateno = 400 && movecontact
trigger7 = stateno = 401 && movecontact

;---------------------------------------------------------------------------
; Stand Hard Kick
[State -1, s.HK - Pogohammer 2]
type = ChangeState
value = 250
triggerall = command = "c"
triggerall = command != "POGORIDE3"
triggerall = command != "POGO"
triggerall = command != "holddown"
trigger1 = statetype = S
trigger1 = ctrl
trigger2 = stateno = 210 && movecontact
trigger3 = stateno = 430 && movehit

;---------------------------------------------------------------------------
; Crouch Light Punch
[State -1, Crouch Light Punch]
type = ChangeState
value = 400
triggerall = command = "x"
;triggerall = command != "holdfwd"
triggerall = command = "holddown"
trigger1 = statetype = C
trigger1 = ctrl

[State -1, Crouch Light Punch]
type = ChangeState
value = 401
triggerall = command = "x"
triggerall = movecontact
triggerall = command = "holddown"
trigger1 = statetype = C
trigger1 = ctrl
trigger2 = stateno = 400 && movecontact

;---------------------------------------------------------------------------
; Crouch Medium Punch
[State -1, Crouch Medium Punch]
type = ChangeState
value = 410
triggerall = command = "y"
;triggerall = command != "holdfwd"
triggerall = command = "holddown"
trigger1 = statetype = C
trigger1 = ctrl
trigger2 = stateno = 430 && movecontact
trigger3 = stateno = 400 && movecontact
trigger4 = stateno = 401 && movecontact

;---------------------------------------------------------------------------
; Crouch Hard Punch
[State -1, Crouch Hard Punch]
type = ChangeState
value = 420
triggerall = command = "z"
;triggerall = command != "holdfwd"
triggerall = command = "holddown"
trigger1 = statetype = C
trigger1 = ctrl
trigger2 = stateno = 410 && movecontact
trigger3 = stateno = 400 && movecontact
trigger4 = stateno = 401 && movecontact

;---------------------------------------------------------------------------
; Crouch Light Kick
[State -1, Crouch Light Kick]
type = ChangeState
value = 430
triggerall = command = "a"
;triggerall = command != "holdfwd"
triggerall = command = "holddown"
trigger1 = statetype = C
trigger1 = ctrl

;---------------------------------------------------------------------------
; Crouch Medium Kick
[State -1, Crouch Medium Kick]
type = ChangeState
value = 440
triggerall = command = "b"
;triggerall = command != "holdfwd"
triggerall = command != "POGORIDE2_FWD"
triggerall = command = "holddown"
triggerall = prevstateno != 440
trigger1 = statetype = C
trigger1 = ctrl
trigger2 = stateno = 400 && movecontact
trigger3 = stateno = 401 && movecontact


;---------------------------------------------------------------------------
; Crouch Hard Kick
[State -1, Crouch Hard Kick]
type = ChangeState
value = 450
triggerall = command = "c"
triggerall = command = "holddown"
trigger1 = statetype = C
trigger1 = ctrl
trigger2 = stateno = 210 && movecontact
trigger3 = stateno = 240 && movecontact
trigger4 = stateno = 410 && movecontact
trigger5 = stateno = 440 && movecontact
trigger6 = stateno = 400 && movecontact
trigger7 = stateno = 401 && movecontact

;---------------------------------------------------------------------------
; Jump Light Punch
[State -1, Jump Light Punch]
type = ChangeState
value = 600
triggerall = command = "x"
triggerall = command != "NANNA_1"
trigger1 = statetype = A
trigger1 = ctrl

;---------------------------------------------------------------------------
; Jump Medium Punch
[State -1, Jump Medium Punch]
type = ChangeState
value = 610
triggerall = command = "y"
triggerall = command != "NANNA_1"
trigger1 = statetype = A
trigger1 = ctrl
trigger2 = stateno = 600 && movecontact
trigger3 = stateno = 630 && movecontact

;---------------------------------------------------------------------------
; Jump Strong Punch
[State -1, Jump Strong Punch]
type = ChangeState
value = 620
triggerall = command = "z"
trigger1 = statetype = A
trigger1 = ctrl
trigger2 = stateno = 600 && movecontact
trigger3 = stateno = 630 && movecontact
trigger4 = stateno = 610 && movecontact
trigger5 = stateno = 640 && movecontact

;---------------------------------------------------------------------------
; Jump Light Kick
[State -1, Jump Light Kick]
type = ChangeState
value = 630
triggerall = command = "a"
trigger1 = statetype = A
trigger1 = ctrl

;---------------------------------------------------------------------------
; Jump Medium Kick
[State -1, Jump Medium Kick]
type = ChangeState
value = 640
triggerall = command = "b"
trigger1 = statetype = A
trigger1 = ctrl
trigger2 = stateno = 600 && movecontact
trigger3 = stateno = 630 && movecontact

;---------------------------------------------------------------------------
; Jump Hard Kick
[State -1, Jump Hard Kick]
type = ChangeState
value = 650
triggerall = command = "c"
trigger1 = statetype = A
trigger1 = ctrl
trigger2 = stateno = 600 && movecontact
trigger3 = stateno = 630 && movecontact
trigger4 = stateno = 610 && movecontact
trigger5 = stateno = 640 && movecontact

;---------------------------------------------------------------------------
; Pogoride 2 Forward
[State -1, POGO1]
type = ChangeState
value = 760
triggerall = command = "POGORIDE1"
triggerall = command != "POGO"
triggerall = pos Y = 0
trigger1 = statetype = S
trigger1 = ctrl
trigger2 = statetype = C
trigger3 = stateno = 250 && movecontact


;---------------------------------------------------------------------------
; Pogoride 2 Forward
[State -1, POGO2]
type = ChangeState
value = 770
triggerall = command = "POGORIDE2_FWD"
triggerall = command != "POGO"
triggerall = pos Y = 0
trigger1 = statetype = S
trigger1 = ctrl
trigger2 = statetype = C
trigger3 = stateno = 220 && movecontact


;---------------------------------------------------------------------------
; Pogoride 2 Forward
[State -1, POGO3]
type = ChangeState
value = 774
triggerall = power >= 1000
triggerall = command = "POGORIDE3"
triggerall = command != "POGO"
triggerall = pos Y = 0
trigger1 = statetype = S
trigger1 = ctrl
trigger2 = statetype = C



;---------------------------------------------------------------------------
; Nanna Beam
[State -1, Nanna Beam]
type = ChangeState
value = 700
triggerall = power >= 1000
triggerall = command = "NANNA_1"
triggerall = numhelper(710) = 0
triggerall = command != "holddown"
trigger1 = statetype = S
trigger1 = ctrl
trigger2 = stateno = 220 && movecontact

[State -1, Nanna Beam]
type = ChangeState
value = 701
triggerall = power >= 1000
triggerall = command = "NANNA_1"
triggerall = numhelper(710) = 0
triggerall = command != "holddown"
trigger1 = statetype = A
trigger1 = ctrl
trigger2 = stateno = 220 && movecontact

;---------------------------------------------------------------------------
; Nanna Rain
[State -1, Nanna Rain]
type = ChangeState
value = 720
triggerall = power >= 3000
triggerall = command = "NANNA_2"
triggerall = numhelper(710) = 0
triggerall = command != "holddown"
trigger1 = statetype = S
trigger1 = ctrl
trigger2 = stateno = 220 && movecontact

;---------------------------------------------------------------------------
; NANNA L
;[State -1, Nanna Ground Light]
;type = ChangeState
;value = 703
;triggerall = command = "NANNAGND_1"
;triggerall = numhelper(710) = 0
;triggerall = command != "holddown"
;trigger1 = statetype = S
;trigger1 = ctrl

;---------------------------------------------------------------------------
; LV5
[State -1, LV5]
type = ChangeState
value = 912
triggerall = power >= 5000
triggerall = command = "POGO"
triggerall = command != "holddown"
triggerall = command != "GRAB"
trigger1 = statetype = S
trigger1 = ctrl

;---------------------------------------------------------------------------
; Universal Grab
[State -1, Universal Grab]
type = ChangeState
value = 800
triggerall = command = "GRAB"
triggerall = numhelper(710) = 0
triggerall = command != "holddown"
trigger1 = statetype = S
trigger1 = ctrl

;---------------------------------------------------------------------------
[State -1, Drain]
type = powerset
triggerall = p2name = "Training"
trigger1 = stateno = 0
value = 5000