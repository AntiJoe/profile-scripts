#!/bin/sh

tmux kill-session -t stocks
tmux kill-session -t php
tmux kill-session -t pe
tmux kill-session -t peye


SESSION="pe"
SESSIONEXISTS=$(tmux list-sessions | grep $SESSION)

cd ~/gd/PHPaper/Projects/Trials/Screenroom

if [ "$SESSIONEXISTS" = "" ]
then

        tmux new-session -d -s $SESSION 
        tmux new-window -t $SESSION:1 -n 'Screen'

fi

SESSION="peye"
SESSIONEXISTS=$(tmux list-sessions | grep $SESSION)

cd ~/gd/PHPaper/Projects/Trials/Screenroom  

if [ "$SESSIONEXISTS" = "" ]
then

        tmux new-session -d -s $SESSION 
        tmux new-window -t $SESSION:1 -n 'PulpEye'

fi

SESSION="php"
SESSIONEXISTS=$(tmux list-sessions | grep $SESSION)

cd ~/Projects/qwindow

if [ "$SESSIONEXISTS" = "" ]
then

        tmux new-session -d -s $SESSION 
        tmux new-window -t $SESSION:1 -n 'qwindow'

fi

SESSION="stocks"
SESSIONEXISTS=$(tmux list-sessions | grep $SESSION)

cd ~/Projects/stock-review

if [ "$SESSIONEXISTS" = "" ]
then

        tmux new-session -d -s $SESSION 

        tmux rename -t 0 'STOCKS'
        cd ~/Projects/stock-review
        tmux new-window -t $SESSION:1 -n 'all'
        tmux splitw -v
        tmux splitw -h
        tmux selectp -t 0
        tmux splitw -h
        tmux send-keys 'cd tfsa' C-m
        tmux selectp -t 3
        tmux send-keys 'cd margin' C-m
        tmux selectp -t 0
        tmux send-keys 'cd rsp' C-m
        tmux send-keys 'py report.py -v' C-m
        tmux selectp -t 1
        tmux send-keys 'py report.py -v' C-m
        tmux selectp -t 3
        tmux send-keys 'py report.py -v' C-m
        tmux selectp -t 2
        tmux send-keys 'py acc_sum.py -v' C-m


fi





