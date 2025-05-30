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

;-| Special Motions |------------------------------------------------------

[Command]
name = "GRAB"
command = x+a
time = 20

[Command]
name = "JASPERS_1"
command = ~D, DB, B, z
time = 20

[Command]
name = "JASPERS_2"
command = ~D, DB, B, y
time = 20

[Command]
name = "JASPERS_2"
command = ~D, DB, B, x
time = 20


[Command]
name = "OGRE"
command = ~D, DF, F, x+y
time = 20

[Command]
name = "OGRE"
command = ~D, DF, F, y+z
time = 20

[Command]
name = "OGRE"
command = ~D, DF, F, x+z
time = 20


[Command]
name = "PONY"
command = ~D, DF, a+b
time = 20

[Command]
name = "PONY"
command = ~D, DF, b+c
time = 20

[Command]
name = "PONY"
command = ~D, DF, a+c
time = 20

[Command]
name = "YARN_AIR"
command = $DF, c
time = 20

[Command]
name = "qcF"
command = ~D, DF, F, a
time = 20
[Command]
name = "qcF"
command = ~D, DF, F, b
time = 20
[Command]
name = "qcF"
command = ~D, DF, F, c
time = 20


;[Command]
;name = "PONY_2"
;command = ~D, DF, F, b, b
;time = 20
;
;[Command]
;name = "PONY_3"
;command = ~D, DF, F, c, c
;time = 20

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
;---------------------------------------------------------------------------

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
triggerall = anim != 195
triggerall = command != "holddown"
trigger1 = statetype = S
trigger1 = ctrl

;---------------------------------------------------------------------------
; Stand Light Punch
[State -1, Stand Light Punch]
type = ChangeState
value = 200
triggerall = command = "x"
triggerall = command != "holddown"
triggerall = command != "JASPERS_2"
triggerall = command != "OGRE"
triggerall = command != "GRAB"
trigger1 = statetype = S
trigger1 = ctrl

[State -3, 0]
type = ChangeState
triggerall = movecontact
triggerall = command = "x"
triggerall = command != "holddown"
triggerall = command != "GRAB"
trigger1 = stateno = 200 && movecontact
value = 201

;---------------------------------------------------------------------------
; Stand Medium Punch
[State -1, Stand Medium Punch]
type = ChangeState
value = 210
triggerall = command = "y"
triggerall = command != "holddown"
triggerall = command != "JASPERS_2"
triggerall = command != "OGRE"
trigger1 = statetype = S
trigger1 = ctrl
trigger2 = stateno = 200 && movecontact
trigger3 = stateno = 201 && movecontact
trigger4 = stateno = 230 && movecontact
trigger5 = stateno = 231 && movecontact
trigger6 = stateno = 400 && movecontact


;---------------------------------------------------------------------------
; Stand Strong Punch
[State -1, Stand Strong Punch]
type = ChangeState
value = 220
triggerall = command = "z"
triggerall = command != "holddown"
triggerall = command != "JASPERS_1"
triggerall = command != "OGRE"
trigger1 = statetype = S
trigger1 = ctrl
trigger2 = stateno = 210 && movecontact
trigger3 = stateno = 200 && movecontact
trigger4 = stateno = 201 && movecontact
trigger5 = stateno = 230 && movecontact
trigger6 = stateno = 231 && movecontact
trigger7 = stateno = 240 && movecontact
trigger8 = stateno = 400 && movecontact
trigger9 = stateno = 410 && movecontact

;---------------------------------------------------------------------------
; Standing Light Kick
[State -1, Standing Light Kick]
type = ChangeState
value = 230
triggerall = command = "a"
triggerall = command != "holddown"
triggerall = command != "PONY"
triggerall = command != "GRAB"
trigger1 = statetype = S
trigger1 = ctrl

[State -3, 0]
type = ChangeState
triggerall = movecontact
triggerall = command = "a"
triggerall = command != "holddown"
triggerall = command != "GRAB"
trigger1 = stateno = 230 && movecontact
value = 231

;---------------------------------------------------------------------------
; Standing Medium Kick
[State -1, Standing Medium Kick]
type = ChangeState
value = 240
triggerall = command = "b"
triggerall = command != "holddown"
triggerall = command != "PONY"
trigger1 = statetype = S
trigger1 = ctrl
trigger2 = stateno = 200 && movecontact
trigger3 = stateno = 201 && movecontact
trigger4 = stateno = 230 && movecontact
trigger5 = stateno = 231 && movecontact
trigger6 = stateno = 400 && movecontact

;---------------------------------------------------------------------------
; Standing Strong Kick
[State -1, Standing Strong Kick]
type = ChangeState
value = 250
triggerall = command = "c"
triggerall = command != "holddown"
triggerall = command != "PONY"
trigger1 = statetype = S
trigger1 = ctrl
trigger2 = stateno = 210 && movecontact
trigger3 = stateno = 200 && movecontact
trigger4 = stateno = 201 && movecontact
trigger5 = stateno = 230 && movecontact
trigger6 = stateno = 231 && movecontact
trigger7 = stateno = 240 && movecontact
trigger8 = stateno = 400 && movecontact
trigger9 = stateno = 410 && movecontact

;-----------------------------------------------------
;combo crouch Z/stand y/stand c----> air attack
[State -1]
type = ChangeState
value = 40
triggerall = command = "holdup"
trigger1 = stateno = 250 && movecontact

;---------------------------------------------------------------------------
; Jaspers Grab LIGHT
[State -1, Jaspers Grab LIGHT]
type = ChangeState
value = 721
triggerall = command = "JASPERS_2"
triggerall = command != "holddown"
trigger1 = statetype = S
trigger1 = ctrl

[State -1, Jaspers Grab LIGHT]
type = ChangeState
value = 727
triggerall = command = "JASPERS_2"
triggerall = command != "holddown"
trigger1 = statetype = a
trigger1 = ctrl

;---------------------------------------------------------------------------
; Jaspers Grab HARD
[State -1, Jaspers Grab HARD]
type = ChangeState
value = 714
triggerall = command = "JASPERS_1"
triggerall = command != "holddown"
trigger1 = statetype = S
trigger1 = ctrl

; Jaspers Grab HARD
[State -1, Jaspers Grab HARD]
type = ChangeState
value = 713
triggerall = command = "JASPERS_1"
triggerall = command != "holddown"
trigger1 = statetype = a
trigger1 = ctrl


;---------------------------------------------------------------------------
; LV5 OGRE
[State -1, LV5 OGRE]
type = ChangeState
value = 912
triggerall = power >= 5000
triggerall = command = "OGRE"
triggerall = command != "holddown"
triggerall = command != "GRAB"
trigger1 = statetype = S
trigger1 = ctrl


;---------------------------------------------------------------------------
; LV3 PONY
[State -1, LV3 PONY]
type = ChangeState
value = 680
triggerall = command = "PONY"
triggerall = command != "holddown"
triggerall = command != "GRAB"
triggerall = power >= 3000
trigger1 = statetype = S
trigger1 = ctrl
trigger2 = stateno = 250 && movecontact
trigger3 = stateno = 220 && movecontact

;---------------------------------------------------------------------------
; Crouching Light Punch
[State -1, Crouching Light Punch]
type = ChangeState
value = 400
triggerall = command = "x"
triggerall = command = "holddown"
trigger1 = statetype = C
trigger1 = ctrl
trigger2 = stateno = 454

;---------------------------------------------------------------------------
; Crouching Medium Punch
[State -1, Crouching Medium Punch]
type = ChangeState
value = 410
triggerall = command = "y"
triggerall = command = "holddown"
trigger1 = statetype = C
trigger1 = ctrl
trigger2 = stateno = 400
trigger3 = stateno = 430
trigger4 = stateno = 454

;---------------------------------------------------------------------------
; Crouching Hard Punch
[State -1, Crouching Hard Punch]
type = ChangeState
value = 420
triggerall = command = "z"
triggerall = command = "holddown"
trigger1 = statetype = C
trigger1 = ctrl

;---------------------------------------------------------------------------
; Crouching Light Kick
[State -1, Crouching Light Kick]
type = ChangeState
value = 430
triggerall = command = "a"
triggerall = command = "holddown"
trigger1 = statetype = C
trigger1 = ctrl
trigger2 = stateno = 454

;---------------------------------------------------------------------------
; Crouching Medium Kick
[State -1, Crouching Medium Kick]
type = ChangeState
value = 440
triggerall = command = "b"
triggerall = command = "holddown"
;triggerall = stateno != 454
trigger1 = statetype = C
trigger1 = ctrl
trigger2 = stateno = 400
trigger3 = stateno = 430
trigger4 = stateno = 454

;---------------------------------------------------------------------------
; Crouching Hard Kick
[State -1, Crouching Hard Kick]
type = ChangeState
value = 460
triggerall = command = "c"
triggerall = command = "holddown"
triggerall = command != "holddownfwd"
trigger1 = statetype = C
trigger1 = ctrl
;trigger2 = stateno = 440 && movecontact

;---------------------------------------------------------------------------
; Crouching Hard Kick
[State -1, Crouching Hard Kick]
type = ChangeState
value = 450
triggerall = command = "c"
triggerall = command = "holddownfwd"
trigger1 = statetype = C
trigger1 = ctrl

;---------------------------------------------------------------------------
; Jump Light Punch
[State -1, Jump Light Punch]
type = ChangeState
value = 600
triggerall = command = "x"
triggerall = command != "JASPERS_2"
trigger1 = statetype = A
trigger1 = ctrl

;---------------------------------------------------------------------------
; Jump Medium Punch
[State -1, Jump Medium Punch]
type = ChangeState
value = 610
triggerall = command = "y"
triggerall = command != "JASPERS_2"
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
triggerall = command != "JASPERS_1"
trigger1 = statetype = A
trigger1 = ctrl
trigger2 = stateno = 610 && movecontact
trigger3 = stateno = 640 && movecontact
trigger4 = stateno = 600 && movecontact
trigger5 = stateno = 630 && movecontact

;---------------------------------------------------------------------------
; Jump Light Kick
[State -1, Jump Light Kick]
type = ChangeState
value = 630
triggerall = command != "qcF"
triggerall = command = "a"
trigger1 = statetype = A
trigger1 = ctrl

;---------------------------------------------------------------------------
; Jump Medium Kick
[State -1, Jump Medium Kick]
type = ChangeState
value = 640
triggerall = command != "qcF"
triggerall = command = "b"
trigger1 = statetype = A
trigger1 = ctrl
trigger2 = stateno = 630 && movecontact
trigger3 = stateno = 600 && movecontact

;---------------------------------------------------------------------------
; Jump Strong Kick
[State -1, Jump Strong Kick]
type = ChangeState
value = 650
triggerall = command != "qcF"
triggerall = command = "c"
trigger1 = statetype = A
trigger1 = ctrl
trigger2 = stateno = 610 && movecontact
trigger3 = stateno = 640 && movecontact
trigger4 = stateno = 600 && movecontact
trigger4 = stateno = 630 && movecontact
trigger5 = stateno = 660 && movecontact

;---------------------------------------------------------------------------
; Jump Special 1
[State -1, Jump Special 1]
type = ChangeState
value = 660
triggerall = command = "qcF"
triggerall = numhelper(716) = 0
trigger1 = statetype = A
trigger1 = ctrl
trigger2 = stateno = 620 && movecontact
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
[State -1, Drain]
type = powerset
triggerall = p2name = "Training"
trigger1 = stateno = 0
value = 5000