#!/bin/sh

BLANK='#00000000'
CLEAR='#ffffff22'
DEFAULT='#ffffff22'
TEXT='#ffffffff'
WRONG='#ffffffff'
VERIFYING='#00000022'

i3lock \
--insidever-color=$CLEAR     \
--ringver-color=$VERIFYING   \
\
--insidewrong-color=$CLEAR   \
--ringwrong-color=$WRONG     \
\
--inside-color=$BLANK        \
--ring-color=$DEFAULT        \
--line-color=$BLANK          \
--separator-color=$DEFAULT   \
\
--verif-color=$TEXT          \
--wrong-color=$TEXT          \
--time-color=$TEXT           \
--date-color=$TEXT           \
--keyhl-color=$WRONG         \
--bshl-color=$WRONG          \
\
--clock                      \
--indicator                  \
--time-str="%H:%M"        \
--date-str="%A | %d/%m/%Y"   \
--image ~/.config/wallpapers/lockscreen.jpg \
\
--verif-font="Rajdhani" \
--wrong-font="Rajdhani" \
--time-font="Rajdhani"  \
--date-font="Rajdhani" \
--greeter-font="Rajdhani" \
\
--time-size=60		\
--date-size=33 		\
--verif-size=10		\
--wrong-size=20		\
--layout-size=10	\
--radius=180	 	\
--ring-width=5		\
--greeter-size=32	\
\
--verif-text=""		\
--wrong-text="Incorrect password entered"	\
--noinput-text=""	\
--lock-text=""		\
--lockfailed-text=""	\
--greeter-text=""	\
