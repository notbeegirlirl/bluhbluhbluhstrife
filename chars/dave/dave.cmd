; The CMD file.
;
; Two parts: 1. Command definition and  2. State entry
; (state entry is after the commands def section)
;
; 1. Command definition
; ---------------------
; Note: The commands are CASE-SENSITIVE, and so are the command names.
; The eight directions are:
;   B, DB, D, DF, F, UF, U, UB     (all CAPS)
;   corresponding to back, down-back, down, downforward, etc.
; The six buttons are:
;   a, b, c, x, y, z               (all lower case)
;   In default key config, abc are are the bottom, and xyz are on the
;   top row. For 2 button characters, we recommend you use a and b.
;   For 6 button characters, use abc for kicks and xyz for punches.
;
; Each [Command] section defines a command that you can use for
; state entry, as well as in the CNS file.
; The command section should look like:
;
;   [Command]
;   name = some_name
;   command = the_command
;   time = time (optional -- defaults to 15 if omitted)
;
; - some_name
;   A name to give that command. You'll use this name to refer to
;   that command in the state entry, as well as the CNS. It is case-
;   sensitive (QCB_a is NOT the same as Qcb_a or QCB_A).
;
; - command
;   list of buttons or directions, separated by commas.
;   Directions and buttons can be preceded by special characters:
;   slash (/) - means the key must be held down
;          egs. command = /D       ;hold the down direction
;               command = /DB, a   ;hold down-back while you press a
;   tilde (~) - to detect key releases
;          egs. command = ~a       ;release the a button
;               command = ~D, F, a ;release down, press fwd, then a
;          If you want to detect "charge moves", you can specify
;          the time the key must be held down for (in game-ticks)
;          egs. command = ~30a     ;hold a for at least 30 ticks, then release
;   dollar ($) - Direction-only: detect as 4-way
;          egs. command = $D       ;will detect if D, DB or DF is held
;               command = $B       ;will detect if B, DB or UB is held
;   plus (+) - Buttons only: simultaneous press
;          egs. command = a+b      ;press a and b at the same time
;               command = x+y+z    ;press x, y and z at the same time
;   You can combine them:
;     eg. command = ~30$D, a+b     ;hold D, DB or DF for 30 ticks, release,
;                                  ;then press a and b together
;   It's recommended that for most "motion" commads, eg. quarter-circle-fwd,
;   you start off with a "release direction". This matches the way most
;   popular fighting games implement their command detection.
;
; - time (optional)
;   Time allowed to do the command, given in game-ticks. Defaults to 15
;   if omitted
;
; If you have two or more commands with the same name, all of them will
; work. You can use it to allow multiple motions for the same move.
;
; Some common commands examples are given below.
;
; [Command] ;Quarter circle forward + x
; name = "QCF_x"
; command = ~D, DF, F, x
;
; [Command] ;Half circle back + a
; name = "HCB_a"
; command = ~F, DF, D, DB, B, a
;
; [Command] ;Two quarter circles forward + y
; name = "2QCF_y"
; command = ~D, DF, F, D, DF, F, y
;
; [Command] ;Tap b rapidly
; name = "5b"
; command = b, b, b, b, b
; time = 30
;
; [Command] ;Charge back, then forward + z
; name = "charge_B_F_z"
; command = ~60$B, F, z
; time = 10
; 
; [Command] ;Charge down, then up + c
; name = "charge_D_U_c"
; command = ~60$D, U, c
; time = 10
; 

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

[Command]
name = "GRAB"
command = x+a
time = 20

[Command]
name = "RAPID"
command = F, F, s
time = 20

[Command]
name = "DEADCROW"
command = ~D, DF, F, z
time = 20

[Command]
name = "LIVECROW"
command = ~D, DF, F, x
time = 20

[Command]
name = "LIVECROW"
command = ~D, DF, F, y
time = 20

;there are two of each prick commands so that the z inputs are more flexible
[Command]
name = "INSUFPRI_L"
command = ~F, DF, D, DF, a
time = 20

[Command]
name = "INSUFPRI_L"
command = ~F, D, DF, a
time = 20

[Command]
name = "INSUFPRI_M"
command = ~F, DF, D, DF, b
time = 20

[Command]
name = "INSUFPRI_M"
command = ~F, D, DF, b
time = 20

[Command]
name = "INSUFPRI_H"
command = ~F, DF, D, DF, c
time = 20

[Command]
name = "INSUFPRI_H"
command = ~F, D, DF, c
time = 20

[Command]
name = "SMUPPETS"
command = ~D, DF, F, a+c
time = 20

[Command]
name = "SMUPPETS"
command = ~D, DF, F, b+c
time = 20

[Command]
name = "SMUPPETS"
command = ~D, DF, F, a+b
time = 20

;-| Special Motions |------------------------------------------------------

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
; 2. State entry
; --------------
; This is where you define what commands bring you to what states.
;
; Each state entry block looks like:
;   [State -1, Label]           ;Change Label to any name you want to use to
;                               ;identify the state with.
;   type = ChangeState          ;Don't change this
;   value = new_state_number
;   trigger1 = command = command_name
;   . . .  (any additional triggers)
;
; - new_state_number is the number of the state to change to
; - command_name is the name of the command (from the section above)
; - Useful triggers to know:
;   - statetype
;       S, C or A : current state-type of player (stand, crouch, air)
;   - ctrl
;       0 or 1 : 1 if player has control. Unless "interrupting" another
;                move, you'll want ctrl = 1
;   - stateno
;       number of state player is in - useful for "move interrupts"
;   - movecontact
;       0 or 1 : 1 if player's last attack touched the opponent
;                useful for "move interrupts"
;
; Note: The order of state entry is important.
;   State entry with a certain command must come before another state
;   entry with a command that is the subset of the first.  
;   For example, command "fwd_a" must be listed before "a", and
;   "fwd_ab" should come before both of the others.
;
; For reference on triggers, see CNS documentation.
;
; Just for your information (skip if you're not interested):
; This part is an extension of the CNS. "State -1" is a special state
; that is executed once every game-tick, regardless of what other state
; you are in.


; Don't remove the following line. It's required by the CMD standard.
[Statedef -1]

;===========================================================================
;AI ACTIVATION
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

;---------------------------------------------------------------------------
; Taunt
[State -1, Taunt]
type = ChangeState
value = 195
triggerall = command = "s"
triggerall = command != "holddown"
trigger1 = statetype = S
trigger1 = ctrl

;---------------------------------------------------------------------------
; Stand Light Punch
[State -1, s.LP - Punch]
type = ChangeState
value = 200
triggerall = command = "x"
triggerall = command != "LIVECROW"
triggerall = command != "holddown"
triggerall = command != "SMUPPETS"
triggerall = command != "GRAB"
triggerall = pos Y = 0
trigger1 = statetype = S
trigger1 = ctrl

[State -3, 0]
type = ChangeState
triggerall = movecontact
triggerall = command = "x"
triggerall = command != "GRAB"
triggerall = command != "holddown"
trigger1 = stateno = 200 && movecontact
value = 201

;---------------------------------------------------------------------------
[State -1, s.MP - L>R Slash]
type = ChangeState
value = 210
triggerall = command = "y"
triggerall = command != "LIVECROW"
triggerall = command != "holdfwd"
triggerall = command != "holddown"
trigger1 = statetype = S
trigger1 = ctrl
trigger2 = stateno = 200 && movecontact
trigger3 = stateno = 230 && movecontact
trigger4 = stateno = 400 && movecontact
trigger5 = stateno = 201 && movecontact

[State -3, 0]
type = ChangeState
triggerall = movecontact
triggerall = command = "y"
triggerall = command != "holdfwd"
triggerall = command != "holddown"
trigger1 = stateno = 400 && movecontact
value = 210


[State -1, s.MP_Fwd - L>R Slash]
type = ChangeState
value = 211
triggerall = command = "y"
triggerall = command = "holdfwd"
triggerall = command != "LIVECROW"
triggerall = command != "holddown"
trigger1 = statetype = S
trigger1 = ctrl
trigger2 = stateno = 200 && movecontact
trigger3 = stateno = 230 && movecontact
trigger4 = stateno = 400 && movecontact
trigger5 = stateno = 201 && movecontact

[State -3, 0]
type = ChangeState
triggerall = movecontact
triggerall = command = "y"
triggerall = command = "holdfwd"
triggerall = command != "holddown"
trigger1 = stateno = 400 && movecontact
value = 211

;---------------------------------------------------------------------------
[State -1, s.HP - Hard Slash]
type = ChangeState
value = 220
triggerall = command = "z"
triggerall = command != "DEADCROW"
triggerall = command != "SMUPPETS"
triggerall = command != "holdfwd"
triggerall = command != "holddown"
trigger1 = statetype = S
trigger1 = ctrl
trigger2 = stateno = 210 && movecontact
trigger3 = stateno = 211 && movecontact
trigger4 = stateno = 240 && movecontact
trigger5 = stateno = 241 && movecontact

[State -3, 0]
type = ChangeState
triggerall = movecontact
triggerall = command = "z"
triggerall = command != "holdfwd"
triggerall = command != "holddown"
trigger1 = stateno = 410 && movecontact
trigger2 = stateno = 440 && movecontact
value = 220


[State -1, s.HP_Fwd - Hard Slash]
type = ChangeState
value = 221
triggerall = command = "z"
triggerall = command = "holdfwd"
triggerall = command != "DEADCROW"
triggerall = command != "holddown"
trigger1 = statetype = S
trigger1 = ctrl
trigger2 = stateno = 210 && movecontact
trigger3 = stateno = 211 && movecontact
trigger4 = stateno = 240 && movecontact
trigger5 = stateno = 241 && movecontact

[State -3, 0]
type = ChangeState
triggerall = movecontact
triggerall = command = "z"
triggerall = command = "holdfwd"
triggerall = command != "holddown"
trigger1 = stateno = 410 && movecontact
trigger2 = stateno = 440 && movecontact
value = 221

;---------------------------------------------------------------------------
[State -1, Stand Light Kick]
type = ChangeState
value = 230
triggerall = command = "a"
triggerall = command != "holddown"
triggerall = command != "INSUFPRI_L"
triggerall = command != "SMUPPETS"
triggerall = command != "GRAB"
trigger1 = statetype = S
trigger1 = ctrl

;---------------------------------------------------------------------------
[State -1, Stand Medium Kick]
type = ChangeState
value = 240
triggerall = command = "b"
triggerall = command != "holdfwd"
triggerall = command != "holddown"
triggerall = command != "INSUFPRI_M"
triggerall = command != "SMUPPETS"
trigger1 = statetype = S
trigger1 = ctrl
trigger2 = stateno = 200 && movecontact
trigger3 = stateno = 230 && movecontact
trigger4 = stateno = 201 && movecontact

[State -3, 0]
type = ChangeState
triggerall = movecontact
triggerall = command = "b"
triggerall = command != "holdfwd"
triggerall = command != "holddown"
trigger1 = stateno = 400 && movecontact
value = 240

[State -1, Stand Medium Kick Forward]
type = ChangeState
value = 241
triggerall = command = "b"
triggerall = command = "holdfwd"
triggerall = command != "holddown"
triggerall = command != "SMUPPETS"
triggerall = command != "INSUFPRI_M"
trigger1 = statetype = S
trigger1 = ctrl
trigger2 = stateno = 200 && movecontact
trigger3 = stateno = 230 && movecontact
trigger4 = stateno = 201 && movecontact

[State -3, 0]
type = ChangeState
triggerall = movecontact
triggerall = command = "b"
triggerall = command = "holdfwd"
triggerall = command != "holddown"
trigger1 = stateno = 400 && movecontact
value = 241

;---------------------------------------------------------------------------
; Stand Hard Kick
[State -1, Stand Hard Kick]
type = ChangeState
value = 250
triggerall = command = "c"
;triggerall = command = "holdfwd"
triggerall = command != "holddown"
triggerall = command != "INSUFPRI_H"
triggerall = command != "SMUPPETS"
trigger1 = statetype = S
trigger1 = ctrl
trigger2 = stateno = 210 && movecontact
trigger3 = stateno = 211 && movecontact
trigger4 = stateno = 240 && movecontact
trigger5 = stateno = 241 && movecontact

[State -3, 0]
type = ChangeState
triggerall = movecontact
triggerall = command = "c"
triggerall = command != "holdfwd"
triggerall = command != "holddown"
trigger1 = stateno = 410 && movecontact
trigger2 = stateno = 440 && movecontact
value = 250

;---------------------------------------------------------------------------
; DeadCrow
[State -1, DeadCrow]
type = ChangeState
value = 700
triggerall = power>=3000
triggerall = command = "DEADCROW"
triggerall = command != "holddown"
triggerall = numhelper(770) = 0
triggerall = numhelper(701) = 0
trigger1 = statetype = S
trigger1 = ctrl

[State -3, 0]
type = ChangeState
triggerall = movecontact
triggerall = command = "DEADCROW" && power >= 3000
triggerall = numhelper(770) = 0
triggerall = numhelper(701) = 0
trigger1 = stateno = 220 && movecontact
trigger2 = stateno = 221 && movecontact
trigger3 = stateno = 250 && movecontact
trigger4 = stateno = 420 && movecontact
trigger5 = stateno = 450 && movecontact
value = 700

; LiveCrow
[State -1, LiveCrow]
type = ChangeState
value = 769
triggerall = command = "LIVECROW" && power >= 1000
triggerall = command != "holddown"
triggerall = numhelper(770) = 0
triggerall = numhelper(701) = 0
trigger1 = statetype = S
trigger1 = ctrl

[State -3, 0]
type = ChangeState
triggerall = movecontact
triggerall = command = "LIVECROW" && power >= 1000
triggerall = numhelper(770) = 0
triggerall = numhelper(701) = 0
trigger1 = stateno = 220 && movecontact
trigger2 = stateno = 221 && movecontact
trigger3 = stateno = 250 && movecontact
trigger4 = stateno = 420 && movecontact
trigger5 = stateno = 450 && movecontact
value = 768

; LiveCrow
[State -1, LiveCrow]
type = ChangeState
value = 768
triggerall = command = "LIVECROW" && power >= 1000
triggerall = command != "holddown"
trigger1 = statetype = A
trigger1 = ctrl
trigger1 = stateno = 640 && movecontact
trigger2 = stateno = 650 && movecontact
trigger3 = stateno = 620 && movecontact


;---------------------------------------------------------------------------
; Insufferable Prick L
[State -1, Insufferable Prick L]
type = ChangeState
value = 720
triggerall = command = "INSUFPRI_L"
triggerall = command != "holddown"
triggerall = command != "GRAB"
triggerall = pos Y = 0
trigger1 = statetype = S || statetype = C
trigger1 = ctrl
trigger2 = stateno = 250 && movecontact

;---------------------------------------------------------------------------
; Insufferable Prick M
[State -1, Insufferable Prick M]
type = ChangeState
value = 723
triggerall = command = "INSUFPRI_M"
triggerall = command != "holddown"
triggerall = pos Y = 0
trigger1 = statetype = S || statetype = C
trigger1 = ctrl
trigger2 = stateno = 250 && movecontact

;---------------------------------------------------------------------------
; Insufferable Prick H
[State -1, Insufferable Prick H]
type = ChangeState
value = 724
triggerall = command = "INSUFPRI_H"
triggerall = command != "holddown"
triggerall = pos Y = 0
trigger1 = statetype = S || statetype = C
trigger1 = ctrl
trigger2 = stateno = 250 && movecontact

;---------------------------------------------------------------------------
; SECRET (Smuppet Smackdown)
[State -1, SMUPPETS]
type = ChangeState
value = 750
triggerall = power>=5000
triggerall = command = "SMUPPETS"
triggerall = command != "GRAB"
triggerall = command != "holddown"
trigger1 = statetype = S
trigger1 = ctrl

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
trigger2 = stateno = 400 && movecontact

[State -3, 0]
type = ChangeState
triggerall = movecontact
triggerall = command = "y"
triggerall = command = "holddown"
trigger1 = stateno = 200 && movecontact
trigger2 = stateno = 230 && movecontact
value = 410

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
trigger3 = stateno = 440 && movecontact

;---------------------------------------------------------------------------
; Crouch Dash
[State -1, Crouch Dash]
type = ChangeState
value = 430
triggerall = command = "a"
;triggerall = command != "holdfwd"
triggerall = command = "holddown"
triggerall = command != "INSUFPRI_L"
trigger1 = statetype = C
trigger1 = ctrl

;---------------------------------------------------------------------------
; Crouch Medium Kick
[State -1, Crouch Medium Kick]
type = ChangeState
value = 440
triggerall = command = "b"
;triggerall = command != "holdfwd"
triggerall = command = "holddown"
triggerall = command != "INSUFPRI_M"
trigger1 = statetype = C
trigger1 = ctrl
trigger2 = stateno = 400 && movecontact

[State -3, 0]
type = ChangeState
triggerall = movecontact
triggerall = command = "b"
triggerall = command = "holddown"
trigger1 = stateno = 200 && movecontact
trigger2 = stateno = 230 && movecontact
value = 440

;---------------------------------------------------------------------------
; Crouch Hard Kick
[State -1, Crouch Hard Kick]
type = ChangeState
value = 450
triggerall = command = "c"
;triggerall = command != "holdfwd"
triggerall = command = "holddown"
triggerall = command != "INSUFPRI_H"
trigger1 = statetype = C
trigger1 = ctrl
trigger2 = stateno = 410 && movecontact
trigger3 = stateno = 440 && movecontact

;---------------------------------------------------------------------------
; Jump Light Punch
[State -1, Jump Light Punch]
type = ChangeState
value = 600
triggerall = command = "x"
trigger1 = statetype = A
trigger1 = ctrl

;---------------------------------------------------------------------------
; Jump Medium Punch
[State -1, Jump Medium Punch]
type = ChangeState
value = 610
triggerall = command = "y"
triggerall = command != "LIVECROW"
trigger1 = statetype = A
trigger1 = ctrl
trigger2 = stateno = 600 && movecontact
trigger3 = stateno = 630 && movecontact
trigger4 = stateno = 631 && movecontact

;---------------------------------------------------------------------------
; Jump Hard Punch
[State -1, Jump Hard Punch]
type = ChangeState
value = 620
triggerall = command = "z"
trigger1 = statetype = A
trigger1 = ctrl
trigger2 = stateno = 610 && movecontact
trigger3 = stateno = 640 && movecontact

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
trigger4 = stateno = 631 && movecontact

;---------------------------------------------------------------------------
; Jump Hard Kick
[State -1, Jump Hard Kick]
type = ChangeState
value = 650
triggerall = command = "c"
trigger1 = statetype = A
trigger1 = ctrl
trigger2 = stateno = 610 && movecontact
trigger3 = stateno = 640 && movecontact

;---------------------------------------------------------------------------
; Universal Grab
[State -1, Universal Grab]
type = ChangeState
value = 800
triggerall = command = "GRAB"
triggerall = command != "holddown"
trigger1 = statetype = S
trigger1 = ctrl

;---------------------------------------------------------------------------
; Slash AI
[State AI, Slash]
Type=Changestate
Triggerall=var(59)>0 ; Use this only if the AI is ON
Triggerall=Statetype=S ; Game rules still apply to the AI
Triggerall=abs(P2Bodydist X)<90 ; use this move only when the opponent is close enough. Moves usually don't hit the entire screen, so specifying the distance this way is necessary
Triggerall=P2StateType=S; use it only if the opponent is standing. This way, we don't need to worry about the y position of the opponent, and we won't use it when the opponent is on the ground or is falling. Using other triggers in other cases like P2dist Y, enemynear,pos Y, P2Stateype!=L,!enemynear,hitfall, etc... might be necessary.
;Triggerall=!Inguarddist; Don't use it if in guard distance. We don't want to run into a hit and get our super interrupted. This line is unnecessary if the super cannot be interrupted by hits.
Triggerall=random<var(59)*1.5; 1-1.5="" a="" ai="" and="" around="" attack="" attack.="" attacks="" attacks.="" be="" br="" by="" can="" chance="" combo="" controlled="" determines="" difficulty="" dodging="" easy="" for="" from="" higher="" how="" in="" is="" it="" level.="" likely="" line="" long="" lower="" most="" multiplier="" of="" on="" only="" or="" powerful="" recommended="" reduces="" s="" so="" starter="" t="" that="" the="" this="" to="" triggerall="AILevel>=3;" use="" used="" using="" value="" values="" want="" we="" what=""> 
Trigger1 = ctrl
value=200

; Slash1 AI
[State AI, Slash1]
Type=Changestate
Triggerall=var(59)>0 ; Use this only if the AI is ON
Triggerall=Statetype=S ; Game rules still apply to the AI
Triggerall=abs(P2Bodydist X)<90 ; use this move only when the opponent is close enough. Moves usually don't hit the entire screen, so specifying the distance this way is necessary
Triggerall=P2StateType=S; use it only if the opponent is standing. This way, we don't need to worry about the y position of the opponent, and we won't use it when the opponent is on the ground or is falling. Using other triggers in other cases like P2dist Y, enemynear,pos Y, P2Stateype!=L,!enemynear,hitfall, etc... might be necessary.
Triggerall=!Inguarddist; Don't use it if in guard distance. We don't want to run into a hit and get our super interrupted. This line is unnecessary if the super cannot be interrupted by hits.
Triggerall=random<var(59)*1.3; 1-1.5="" a="" ai="" and="" around="" attack="" attack.="" attacks="" attacks.="" be="" br="" by="" can="" chance="" combo="" controlled="" determines="" difficulty="" dodging="" easy="" for="" from="" higher="" how="" in="" is="" it="" level.="" likely="" line="" long="" lower="" most="" multiplier="" of="" on="" only="" or="" powerful="" recommended="" reduces="" s="" so="" starter="" t="" that="" the="" this="" to="" triggerall="AILevel>=3;" use="" used="" using="" value="" values="" want="" we="" what=""> 
Trigger1 = stateno = 200 && movehit=1
value=210

; Slash AI
[State AI, Slash2]
Type=Changestate
Triggerall=var(59)>0 ; Use this only if the AI is ON
Triggerall=Statetype=S ; Game rules still apply to the AI
Triggerall=abs(P2Bodydist X)<90 ; use this move only when the opponent is close enough. Moves usually don't hit the entire screen, so specifying the distance this way is necessary
Triggerall=P2StateType=S; use it only if the opponent is standing. This way, we don't need to worry about the y position of the opponent, and we won't use it when the opponent is on the ground or is falling. Using other triggers in other cases like P2dist Y, enemynear,pos Y, P2Stateype!=L,!enemynear,hitfall, etc... might be necessary.
Triggerall=!Inguarddist; Don't use it if in guard distance. We don't want to run into a hit and get our super interrupted. This line is unnecessary if the super cannot be interrupted by hits.
Triggerall=random<var(59)*1.2; 1-1.5="" a="" ai="" and="" around="" attack="" attack.="" attacks="" attacks.="" be="" br="" by="" can="" chance="" combo="" controlled="" determines="" difficulty="" dodging="" easy="" for="" from="" higher="" how="" in="" is="" it="" level.="" likely="" line="" long="" lower="" most="" multiplier="" of="" on="" only="" or="" powerful="" recommended="" reduces="" s="" so="" starter="" t="" that="" the="" this="" to="" triggerall="AILevel>=3;" use="" used="" using="" value="" values="" want="" we="" what=""> 
Trigger1 = stateno = 210 && movehit=1
value=220


; YSlash AI
[State AI, YSlash]
Type=Changestate
Triggerall=var(59)>0 ; Use this only if the AI is ON
Triggerall=Statetype=S ; Game rules still apply to the AI
Triggerall=abs(P2Bodydist X)<90 ; use this move only when the opponent is close enough. Moves usually don't hit the entire screen, so specifying the distance this way is necessary
Triggerall=P2StateType=S; use it only if the opponent is standing. This way, we don't need to worry about the y position of the opponent, and we won't use it when the opponent is on the ground or is falling. Using other triggers in other cases like P2dist Y, enemynear,pos Y, P2Stateype!=L,!enemynear,hitfall, etc... might be necessary.
Triggerall=!Inguarddist; Don't use it if in guard distance. We don't want to run into a hit and get our super interrupted. This line is unnecessary if the super cannot be interrupted by hits.
Triggerall=random<var(59)*1.2; 1-1.5="" a="" ai="" and="" around="" attack="" attack.="" attacks="" attacks.="" be="" br="" by="" can="" chance="" combo="" controlled="" determines="" difficulty="" dodging="" easy="" for="" from="" higher="" how="" in="" is="" it="" level.="" likely="" line="" long="" lower="" most="" multiplier="" of="" on="" only="" or="" powerful="" recommended="" reduces="" s="" so="" starter="" t="" that="" the="" this="" to="" triggerall="AILevel>=3;" use="" used="" using="" value="" values="" want="" we="" what=""> 
Trigger1 = ctrl
value=230

; YSlash1 AI
[State AI, YSlash1]
Type=Changestate
Triggerall=var(59)>0 ; Use this only if the AI is ON
Triggerall=Statetype=S ; Game rules still apply to the AI
Triggerall=abs(P2Bodydist X)<90 ; abs(P2Bodydist X)<150 ; use this move only when the opponent is close enough. Moves usually don't hit the entire screen, so specifying the distance this way is necessary
Triggerall=P2StateType=S; use it only if the opponent is standing. This way, we don't need to worry about the y position of the opponent, and we won't use it when the opponent is on the ground or is falling. Using other triggers in other cases like P2dist Y, enemynear,pos Y, P2Stateype!=L,!enemynear,hitfall, etc... might be necessary.
Triggerall=!Inguarddist; Don't use it if in guard distance. We don't want to run into a hit and get our super interrupted. This line is unnecessary if the super cannot be interrupted by hits.
Triggerall=random<var(59)*1.3; 1-1.5="" a="" ai="" and="" around="" attack="" attack.="" attacks="" attacks.="" be="" br="" by="" can="" chance="" combo="" controlled="" determines="" difficulty="" dodging="" easy="" for="" from="" higher="" how="" in="" is="" it="" level.="" likely="" line="" long="" lower="" most="" multiplier="" of="" on="" only="" or="" powerful="" recommended="" reduces="" s="" so="" starter="" t="" that="" the="" this="" to="" triggerall="AILevel>=3;" use="" used="" using="" value="" values="" want="" we="" what=""> 
Trigger1 = stateno = 220 && movehit=1
value=240

; YSlash AI
[State AI, YSlash]
Type=Changestate
Triggerall=var(59)>0 ; Use this only if the AI is ON
Triggerall=Statetype=S ; Game rules still apply to the AI
Triggerall=abs(P2Bodydist X)<90 ; use this move only when the opponent is close enough. Moves usually don't hit the entire screen, so specifying the distance this way is necessary
Triggerall=P2StateType=S; use it only if the opponent is standing. This way, we don't need to worry about the y position of the opponent, and we won't use it when the opponent is on the ground or is falling. Using other triggers in other cases like P2dist Y, enemynear,pos Y, P2Stateype!=L,!enemynear,hitfall, etc... might be necessary.
Triggerall=!Inguarddist; Don't use it if in guard distance. We don't want to run into a hit and get our super interrupted. This line is unnecessary if the super cannot be interrupted by hits.
Triggerall=random<var(59)*1.1; 1-1.5="" a="" ai="" and="" around="" attack="" attack.="" attacks="" attacks.="" be="" br="" by="" can="" chance="" combo="" controlled="" determines="" difficulty="" dodging="" easy="" for="" from="" higher="" how="" in="" is="" it="" level.="" likely="" line="" long="" lower="" most="" multiplier="" of="" on="" only="" or="" powerful="" recommended="" reduces="" s="" so="" starter="" t="" that="" the="" this="" to="" triggerall="AILevel>=3;" use="" used="" using="" value="" values="" want="" we="" what=""> 
Trigger1 = ctrl
value=220

; YSlash1 AI
[State AI, YSlash1]
Type=Changestate
Triggerall=var(59)>0 ; Use this only if the AI is ON
Triggerall=Statetype=S ; Game rules still apply to the AI
Triggerall=abs(P2Bodydist X)<90 ; abs(P2Bodydist X)<150 ; use this move only when the opponent is close enough. Moves usually don't hit the entire screen, so specifying the distance this way is necessary
Triggerall=P2StateType=S; use it only if the opponent is standing. This way, we don't need to worry about the y position of the opponent, and we won't use it when the opponent is on the ground or is falling. Using other triggers in other cases like P2dist Y, enemynear,pos Y, P2Stateype!=L,!enemynear,hitfall, etc... might be necessary.
Triggerall=!Inguarddist; Don't use it if in guard distance. We don't want to run into a hit and get our super interrupted. This line is unnecessary if the super cannot be interrupted by hits.
Triggerall=random<var(59)*1.2; 1-1.5="" a="" ai="" and="" around="" attack="" attack.="" attacks="" attacks.="" be="" br="" by="" can="" chance="" combo="" controlled="" determines="" difficulty="" dodging="" easy="" for="" from="" higher="" how="" in="" is="" it="" level.="" likely="" line="" long="" lower="" most="" multiplier="" of="" on="" only="" or="" powerful="" recommended="" reduces="" s="" so="" starter="" t="" that="" the="" this="" to="" triggerall="AILevel>=3;" use="" used="" using="" value="" values="" want="" we="" what=""> 
Trigger1 = stateno = 220 && movehit=1
value=230

; RAPIDSLASH AI
[State AI, RAPIDSLASH]
Type=Changestate
Triggerall=var(59)>0 ; Use this only if the AI is ON
Triggerall=power>=1000
Triggerall=Statetype=S ; Game rules still apply to the AI
Triggerall=abs(P2Bodydist X)<120 ; use this move only when the opponent is close enough. Moves usually don't hit the entire screen, so specifying the distance this way is necessary
Triggerall=life<=0.75*Lifemax
Triggerall=P2StateType=S; use it only if the opponent is standing. This way, we don't need to worry about the y position of the opponent, and we won't use it when the opponent is on the ground or is falling. Using other triggers in other cases like P2dist Y, enemynear,pos Y, P2Stateype!=L,!enemynear,hitfall, etc... might be necessary.
Triggerall=!Inguarddist; Don't use it if in guard distance. We don't want to run into a hit and get our super interrupted. This line is unnecessary if the super cannot be interrupted by hits.
Triggerall=random<var(59)*1; 1-1.5="" a="" ai="" and="" around="" attack="" attack.="" attacks="" attacks.="" be="" br="" by="" can="" chance="" combo="" controlled="" determines="" difficulty="" dodging="" easy="" for="" from="" higher="" how="" in="" is="" it="" level.="" likely="" line="" long="" lower="" most="" multiplier="" of="" on="" only="" or="" powerful="" recommended="" reduces="" s="" so="" starter="" t="" that="" the="" this="" to="" triggerall="AILevel>=3;" use="" used="" using="" value="" values="" want="" we="" what=""> 
Trigger1 = ctrl
value=250

;---------------------------------------------------------------------------
[State -1, Drain]
type = powerset
triggerall = p2name = "Training"
trigger1 = stateno = 0
value = 5000